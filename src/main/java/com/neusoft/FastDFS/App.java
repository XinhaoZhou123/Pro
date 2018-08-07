package com.neusoft.FastDFS;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.csource.common.NameValuePair;

public class App {
		public static void main(String[] args) throws IOException {
		/*	String ext = "jpg";
			FileInputStream fileReader = new FileInputStream("D:/7.jpg");
			byte[] bytes = new byte[5000000];
			int length = fileReader.read(bytes);
			FastDFSFile file = new FastDFSFile(bytes, ext);
			NameValuePair[] meta_list = new NameValuePair[3];
			meta_list[0] = new NameValuePair("filename","abc");
			meta_list[1] = new NameValuePair("fileLength",String.valueOf(length));
			meta_list[2] = new NameValuePair("fileExt",ext);
			meta_list[3] = new NameValuePair("fileAuthor","wangchao");
			
			String filePath = FileManager.upload(file, meta_list);
			System.out.println(filePath);*/
		/*	File file = new File("D:/7.jpg");
			FileInputStream fileReader = new FileInputStream("D:/7.jpg");
			String filepath = FileManager.uploadFile(fileReader, "7.jpg");
			System.out.println(filepath);*/
/*String classPath = new File(FileManager.class.getResource("/").getFile()).getCanonicalPath();
			
			String fdfsClientConfigFilePath = classPath + File.separator ;
			System.out.println(fdfsClientConfigFilePath);*/
			
			File tempFile = File.createTempFile("temp", ".txt");
		//	tempFile.deleteOnExit();
			tempFile.deleteOnExit();
			System.out.println(tempFile.getCanonicalPath());
			//FileInputStream input = new FileInputStream(tempFile);
			FileWriter writter = new FileWriter(tempFile);
			writter.write("hello\r\nworld\r\n");
			writter.flush();
			writter.close();
			BufferedReader reader = new BufferedReader(new FileReader(tempFile));
			String str = null;
			while((str=reader.readLine())!=null){
				System.out.println(str);
			}
		reader.close();
		
}
}
