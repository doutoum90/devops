# Generate dummy data
docker run lucj/genx:0.1 -type cos -duration 3d -min 10 -max 25 -step 1h > /tmp/data

# Send data to telegraf
cat /tmp/data | while read line; do
  ts="$(echo $line | cut -d' ' -f1)000000000"
  value=$(echo $line | cut -d' ' -f2)
  curl -i -XPOST http://telegraf.tick.com/write --data-binary "temp value=${value} ${ts}"
done
