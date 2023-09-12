vlib work
vlog spi.v  spiWrapper.v  ram.v  Project_tb.v
vsim -voptargs=+acc work.project_tb
add wave *
add wave -position insertpoint  \
sim:/project_tb/F/r1/mem \
sim:/project_tb/F/rx_data_z \
sim:/project_tb/F/rx_valid_z \
sim:/project_tb/F/tx_data_z \
sim:/project_tb/F/tx_valid_z \
sim:/project_tb/F/s1/rx_valid \
sim:/project_tb/F/s1/i \
sim:/project_tb/F/s1/counter \
sim:/project_tb/F/s1/cs \
sim:/project_tb/F/r1/wr_addr \
sim:/project_tb/F/r1/rd_addr
run -all
#quit -sim