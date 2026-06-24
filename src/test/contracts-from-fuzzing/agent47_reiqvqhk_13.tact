contract TestReturnInsideRepeat {
    fun f(): Int {
       repeat (3) {
          if (true) {
             return 7;
          }
       }
       return 0;
    }
}
