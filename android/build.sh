echo "bat dau build android"
if [ "$VERSION" == "" ]; then
  source ./getVersion.sh
fi
echo "VERSION = ${VERSION}"
# shellcheck disable=SC2006
APP_NAME=`basename "$PWD"`
# shellcheck disable=SC2006
TARGET_NAME=`date '+%Y%m%d%H%M'`
TARGET_APK=${APP_NAME}_${VERSION}_${TARGET_NAME}.apk
RUNNER_ARCHIVED="build/app/outputs/flutter-apk/app.apk"

flutter build apk > /dev/null 2> /dev/null
if [ -f "$RUNNER_ARCHIVED" ]; then
  mv "$RUNNER_ARCHIVED" "$TARGET_APK" > /dev/null 2> /dev/null
  if [ -f "$TARGET_APK" ]; then
    echo "$TARGET_APK"
  fi
fi
