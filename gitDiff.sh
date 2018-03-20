function git_diff_archive() 
{
  local diff=""
  local h="HEAD"
  if [ $# -eq 1 ]; then
    if expr "$1" : '[0-9]*$' > /dev/null ; then
      diff="HEAD~${1} HEAD"
    else
      diff="${1} HEAD"
    fi
  elif [ $# -eq 2 ]; then
    diff="${2} ${1}"
    h=$1
  fi
  if [ "$diff" != "" ]; then
    diff="git diff --diff-filter=d --name-only ${diff}"
  fi
  git archive --format=zip --prefix=root/ $h `eval $diff` -o archive.zip
}


git archive --format=zip --prefix=root/ HEAD^ `git diff --diff-filter=d --name-only HEAD^ HEAD` -o archive_h1.zip

git archive --format=zip --prefix=root/ HEAD `git diff --diff-filter=d --name-only HEAD^ HEAD` -o archive_h2.zip



# 関数を呼び出す
#git_diff_archive 57a48c89edd7011d5f5e710c4b8d2fc4d9b303e6 a3245a26ee7afb24870302b34f2e2a34bbec991f