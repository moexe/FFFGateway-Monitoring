#!/usr/bin/gnuplot
reset
#set terminal png
set terminal png size 800,400 font ",10"
set output '/var/www/html/has-mon/img/clients.png'
set xdata time
set timefmt "%Y:%m:%d:%H:%M:%S"
set format x "%H:%M"
#set xlabel "time"

set ylabel "Clients"
set yrange [0:670]

#set title "Clients "
#set key center bmargin  font ",10"
set key horizontal reverse samplen 1 width -1 maxrows 1
set grid

set style data lines

plot "/var/www/html/has-mon/data/clients.dat" using 1:2 title "ges", \
"" using 1:3 title "Hassberge", \
"" using 1:4 title "Hassberge Sued", \
#
