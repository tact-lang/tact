contract RegularReturn {
    fun testRegular(x: Int): Int {
         if (x > 0) { 
             return x;
         } else { 
             return -x;
         }
    }
}

contract NestedReturn {
    fun testNested(x: Int): Int {
         {
             if (x == 0) {
                 return 42;
             }
         }
         return x;
    }
}

contract LoopReturn {
    fun testLoop(n: Int): Int {
         let accum: Int = 0;
         repeat (n) {
             // simulate accumulation
             // Note: Tact might require immutable variables, but using augmented assignment for testing
             let newVal: Int = accum + 1;
             // shadow accum with new value, though this might be not allowed; if so, we simulate via immediate return
             if (newVal == 3) {
                 return newVal;
             }
         }
         return accum;
    }
}
