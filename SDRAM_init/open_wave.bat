::echo "��ʼ����"
::cd .\Desktop\test
::iverilog -g2005-sv -o wave padup.v tb.sv
::echo "�������"
::echo "���ɲ����ļ�"
::vvp -n wave -lxt2
::echo "�򿪲����ļ�"
::gtkwave wave.vcd
::pause
@echo off
echo "����filelist"
dir .\*.v /b /s >filelist.f
dir .\*.sv /b /s >>filelist.f
if exist "*.gtkw" (
echo "����gtkw�����ļ�"
echo "��gtkw�����ļ�"
gtkwave *.gtkw
) else (
	if exist "wave.lxt" (
		echo "����lxt�����ļ�"
		echo "��lxt�����ļ�"
		gtkwave wave.lxt
		) else ( 
			echo "�޲����ļ�"
			echo "��ʼ����"
			iverilog -g2005-sv -o wave.vvp  -f filelist.f
			echo "�������"
			echo "����lxt�����ļ�"
			vvp -n wave.vvp -lxt2
			copy wave.vcd wave.lxt
			echo "��lxt���μ�"
			gtkwave wave.lxt
			)
	)
pause
