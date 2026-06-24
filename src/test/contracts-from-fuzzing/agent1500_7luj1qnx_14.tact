contract OnlyStrings {
   s1: String = "foo";
   s2: String = "bar";
   s3: String?;

   init() {
       self.s3 = null;
   }
}