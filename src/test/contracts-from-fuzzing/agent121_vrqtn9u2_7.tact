contract TestReturnInRepeat {
    fun test(): Int {
         let counter: Int = 0;
         repeat (5) {
             counter += 1;
             if (counter == 3) { return counter; }
         }
         return counter;
    }
}
