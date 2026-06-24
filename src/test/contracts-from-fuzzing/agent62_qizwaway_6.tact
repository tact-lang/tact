contract NestedReturnTest {
    fun nestedReturn(x: Int): Int {
         repeat (2) {
             if (x < 0) {
                 return 99;
             }
         }
         return 42;
    }

    receive () {}
}
