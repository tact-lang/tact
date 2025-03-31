contract TestDeepReturn {
    // Function with multiple nested returns and a repeat loop
    fun complexNestedReturn(a: Int): Int {
         if (a < 5) {
             repeat (3) {
                 if (a == 2) {
                     return a * 100;
                 }
             }
             return a + 1;
         } else {
             let x: Int = a > 10 ? a - 10 : a + 10;
             if (x % 2 == 0) {
                 return x / 2;
             }
             return x * 2;
         }
    }

    // Getter with nested conditional return
    get fun complexGetter(): String {
         if (true) {
             return "GetterReturnValue";
         } else {
             return "UnreachableReturn";
         }
    }

    // Receiver with return in both branches
    receive() {
         if (sender() == myAddress()) {
             return;
         } else {
             return;
         }
    }
}
