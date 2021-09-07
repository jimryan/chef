echo "--- system details"
$Properties = 'Caption', 'CSName', 'Version', 'BuildType', 'OSArchitecture'
Get-CimInstance Win32_OperatingSystem | Select-Object $Properties | Format-Table -AutoSize
ruby -v
bundle --version

echo "--- bundle install"
bundle config set --local without omnibus_package docgen chefstyle
bundle install --jobs=3 --retry=3

echo "+++ bundle exec rake"
bundle exec rake spec:unit
bundle exec rake component_specs

exit $LASTEXITCODE