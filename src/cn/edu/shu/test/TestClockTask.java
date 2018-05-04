package cn.edu.shu.test;

import java.text.DecimalFormat;
import java.util.Random;

import org.omg.CORBA.PRIVATE_MEMBER;

import com.sun.org.apache.bcel.internal.generic.NEW;

import cn.edu.shu.service.ICurrentDataService;
import cn.edu.shu.service.IDeviceService;
import cn.edu.shu.service.impl.CurrentServiceImpl;
import cn.edu.shu.service.impl.DeviceServiceImpl;



public class TestClockTask {


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//一个模拟类，每两秒向数据库插入一次数据
final long timeInterval=2000;

Runnable runnable=new Runnable() {
	private ICurrentDataService currentDataService=new CurrentServiceImpl();
	private IDeviceService deviceService=new DeviceServiceImpl();
	private int cishu=0;
	@Override
	public void run() {
		// TODO Auto-generated method stub
		
		while(true){
			 float minValLim = 219.50f;
			   float maxValLim = 221.50f;
			   float minCurLim=4.50f;
			   float maxCurLim=5.50f;
			  
				DecimalFormat decimalFormat=new DecimalFormat(".00");		
		String ranInVal=decimalFormat.format(minValLim + new Random().nextFloat() * (maxValLim - minValLim));
		String ranInCur=decimalFormat.format(minCurLim+new Random().nextFloat()*(maxCurLim-minCurLim));
		String ranOutVal=decimalFormat.format(minValLim + new Random().nextFloat() * (maxValLim - minValLim));
	 String ranOutCur=decimalFormat.format(minCurLim+new Random().nextFloat()*(maxCurLim-minCurLim));
	String deviceIdstr=  String.valueOf(deviceService.getNewestDeviceId());
	currentDataService.insertData(ranInVal, ranInCur, ranOutVal, ranOutCur, deviceIdstr);
	//System.out.println("正在实时插入数据");
     cishu++;
     //计划模拟一分钟的数据
     if (cishu>=20)  break;
     System.out.println("第"+cishu+"次模拟数据");
			try {
				Thread.sleep(timeInterval);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
};
Thread thread=new Thread(runnable);
thread.start();
System.out.println("正在模拟生成实时数据");
	}

}
