contract ReturnInRepeat {
    fun repeatReturn(): Int {
         repeat (3) {
             if (true) {
                 return 100;
             }
         }
         return 0;
    }
    
    receive () {}
}
