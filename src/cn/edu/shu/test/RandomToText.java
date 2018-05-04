package cn.edu.shu.test;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Random;

public class RandomToText {

	public static void main(String[] args) throws IOException {
		 float minValLim = 219.50f;
		   float maxValLim = 221.50f;
		   float minCurLim=4.50f;
		   float maxCurLim=5.50f;
		   String result="";
			DecimalFormat decimalFormat=new DecimalFormat(".00");
		for(int i=0;i<10;i++) {
	String ranInVal=decimalFormat.format(minValLim + new Random().nextFloat() * (maxValLim - minValLim));
	String ranInCur=decimalFormat.format(minCurLim+new Random().nextFloat()*(maxCurLim-minCurLim));
	String ranOutVal=decimalFormat.format(minValLim + new Random().nextFloat() * (maxValLim - minValLim));
 String ranOutCur=decimalFormat.format(minCurLim+new Random().nextFloat()*(maxCurLim-minCurLim));
   String deviceIdStr=String.valueOf((int)(1+Math.random()*10));
	result=ranInVal+","+ranInCur+","+ranOutVal+","+ranOutCur+","+deviceIdStr;
	FileWriter writer = null;
	try {
		writer=new FileWriter("C:\\Users\\yuyinmo\\Desktop\\testData.txt",true);
		writer.write(result);
		writer.write("\r\n");
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	writer.flush();
	writer.close();
	

		}
		System.out.println("写到桌面成功");

	}

}
