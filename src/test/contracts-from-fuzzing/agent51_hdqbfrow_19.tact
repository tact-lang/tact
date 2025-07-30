contract TestReturnInAnonymousBlock {
    fun test(): Int {
         { 
             let tmp: Int = 100;
             if (tmp == 100) {
                 return 200;
             } 
         }
         return 300;
    }
}
