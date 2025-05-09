require 'csv'

def count_by_column(path, col, label, show_count: true)
  counts = Hash.new(0)

  CSV.foreach(path, headers: true, col_sep: "\t") do |row|
    items = row[col].to_s.split(/[,、 ]+/).map(&:strip)
    items.each { |item| counts[item] += 1 unless item.empty? }
  end

  puts "■ #{label}"
  sorted = show_count ? counts.sort_by { |_, v| -v } : counts.keys.sort
  sorted.each do |item|
    if show_count
      puts "- #{item[0]}: #{item[1]}回"
    else
      puts "- #{item}"
    end
  end
  puts
end

# 設定
path = 'resume.tsv'
show_count = true  # trueにすればカウントを表示

count_by_column(path, '技術要素', '技術一覧', show_count: show_count)
count_by_column(path, '担当', '担当一覧', show_count: show_count)
count_by_column(path, '工程', '工程一覧', show_count: show_count)