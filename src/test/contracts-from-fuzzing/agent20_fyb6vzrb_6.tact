contract Test7 {
    fun test(): Int {
         repeat (3) {
              if (true) {
                  return 7;
              }
         }
         return 1;
    }
}
