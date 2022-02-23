import java.io.*;
import java.nio.file.*;

public class Hu_Inserts {

   public static final String delimiter = ", ";
   //public static FileWriter sqlConverter;
   public static void read(String csvFile) {
      try {
         File file = new File(csvFile);
         FileReader fr = new FileReader(file);
         BufferedReader br = new BufferedReader(fr);
         String line = "";
         String tableName = "";
         //String[] tempArr;
         tableName = br.readLine();

        while((line = br.readLine()) != null) 
         {
            String insertStatement = "INSERT INTO " + tableName + " VALUES (" + line + ");";
            //System.out.println(insertStatement);

         	FileWriter fw = new FileWriter("Hu_Inserts.sql", true);
      		PrintWriter pw = new PrintWriter(fw);

      		pw.println(insertStatement);
    		fw.flush();
    		pw.flush();
      		pw.close();
         }
         FileWriter fw = new FileWriter("Hu_Inserts.sql", true);
      	PrintWriter pw = new PrintWriter(fw);

   
      		pw.println("COMMIT;");
    		fw.flush();
    		pw.flush();
      		pw.close();
         br.close();
         
        //sqlConverter = new FileWriter("Hu_Inserts.sql");

         } catch(IOException ioe) {
            ioe.printStackTrace();
         }
   }

   public static void main(String[] args) throws Exception {
      // csv file to read
   		Path path
            = Paths.get("Hu_Inserts.sql");
            Files.deleteIfExists(path);
        

      String agent = "csvfiles\\Agent.csv";
       Hu_Inserts.read(agent);
      String agentPhone = "csvfiles\\AgentPhone.csv";
       Hu_Inserts.read(agentPhone);
      String buyer = "csvfiles\\Buyer.csv";
       Hu_Inserts.read(buyer);
      String seller = "csvfiles\\Seller.csv";
       Hu_Inserts.read(seller);
      String house = "csvfiles\\House.csv";
       Hu_Inserts.read(house);

   }
  
   /*
	  int length =  tempArr.length;
    tempArr = line.split(delimiter);
    String valueContents = "'";
     for(int i = 0; i < length; i++)
             {
            	String tempStr = tempArr[i];
            	valueContents = valueContents + tempStr + "'";
            	if(i != length - 1) {
            		valueContents = valueContents + ", '";
            	}

            }
           */
}