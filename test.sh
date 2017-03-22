if [ $# -ne 2 ]; then
    echo "Insufficient number of arguments."
    echo "Usage: ${0##*/} hashkey date"
    exit 1
fi

hashkey=$1
commitdate=$2

git filter-branch --env-filter \
"if test \$GIT_COMMIT = '$hashkey'
then
export GIT_AUTHOR_DATE='$commitdate'
export GIT_COMMITTER_DATE='$commitdate'
fi" && rm -fr "$(git rev-parse --git-dir)/refs/original/"