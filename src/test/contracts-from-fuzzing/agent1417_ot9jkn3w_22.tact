contract ManyOptionals {
   opt1: Int?;
   opt2: Int?;
   opt3: Int?;

   init() {
     self.opt1 = null;
     self.opt2 = 5;
     self.opt3 = null;
   }
}