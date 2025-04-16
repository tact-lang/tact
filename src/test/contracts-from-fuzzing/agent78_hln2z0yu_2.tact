contract Test {
    fun f(): Int {
         if (true) {
            return 1;
         }
         return 2;
    }

    receive () {}
}
