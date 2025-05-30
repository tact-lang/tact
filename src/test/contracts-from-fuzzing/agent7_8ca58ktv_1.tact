contract Test {
    receive () {}

    fun earlyReturn(): Int {
         if (true) {
              return 42;
         }
         return 0;
    }
}
