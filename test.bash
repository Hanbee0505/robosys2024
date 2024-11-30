#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Hanbee Choi
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

### 正常な出力 ###
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] ||  ng "$LINENO"

### 変な出力 ###
out=$(echo あ | ./plus)
[ "$?" = 1 ] 	  || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./plus)
[ "$?" = 1 ] 	  || ng "$LINENO"
[ "${out}" = "" ] 	  || ng "$LINENO"

[ "$res" = 0 ] && echo OK

exit $res
