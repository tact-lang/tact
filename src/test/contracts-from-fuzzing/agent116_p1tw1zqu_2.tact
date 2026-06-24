contract Test2 {
    fun f(): Int {
         {
              let x: Int = 10;
              if (x > 5) {
                  return x + 1;
              }
         }
         return 0;
    }
}
