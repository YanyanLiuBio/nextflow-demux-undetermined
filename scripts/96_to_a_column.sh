cat count.tsv | awk -F'\t' '
BEGIN {
    OFS = ","
    # Create well names A01-H12
    for (i = 1; i <= 96; i++) {
        row_letter = sprintf("%c", 65 + int((i-1)/12))  # A-H
        col_num = sprintf("%02d", ((i-1) % 12) + 1)     # 01-12
        wells[i] = row_letter col_num
    }
}
NR == 1 {next}  # Skip header
{
    row = ((NR - 2) % 96) + 1
    col = int((NR - 2) / 96) + 1
    data[row, col] = $2
    if (col > max_col) max_col = col
}
END {
    # Print header
    printf "well"
    for (c = 1; c <= max_col; c++) {
        printf ",%s", wells[c]
    }
    printf "\n"
    
    # Print data
    for (r = 1; r <= 96; r++) {
        printf "%s", wells[r]
        for (c = 1; c <= max_col; c++) {
            printf ",%s", (data[r, c] ? data[r, c] : 0)
        }
        printf "\n"
    }
}'
