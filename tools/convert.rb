require 'csv'

input = 'resume.tsv'
output = 'resume.md'

lines = []

CSV.foreach(input, headers: true, col_sep: "\t") do |row|
  title = row['案件名']
  start = row['開始年月']
  end_ = row['終了年月']
  tech = row['技術要素']
  role = row['担当']
  steps = row['工程']

  lines << "### #{title}（#{start} ～ #{end_}）"
  lines << "- 技術: #{tech}"
  lines << "- 担当: #{role}"
  lines << "- 工程: #{steps}"
  lines << ""
end

File.write(output, lines.join("\n"))
puts "✅ Exported to #{output}"
