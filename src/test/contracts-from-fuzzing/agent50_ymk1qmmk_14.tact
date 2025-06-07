contract ReturnFuzzTest {
    v: Int = 0;

    fun testReturn(x: Int): Int {
         if (x > 100) {
             return x;
         } else {
             return x * 2;
         }
    }

    fun nestedBlockReturn(x: Int): Int {
         if (x > 0) {
             { let y = x; return y + 1; }
         } else {
             { let y = x; return y - 1; }
         }
    }

    fun loopReturn(x: Int): Int {
         repeat (3) {
              if (x == 5) {
                  return 999;
              }
         }
         return x;
    }

    get fun getDouble(): Int {
         return self.v * 2;
    }

    receive() {
         // No return allowed, void
    }

    fun main() {
         dump(self.testReturn(50));      // Expect 100
         dump(self.testReturn(150));     // Expect 150
         dump(self.nestedBlockReturn(3));  // Expect 4
         dump(self.nestedBlockReturn(-3)); // Expect -4
         dump(self.loopReturn(5));         // Expect 999
         dump(self.loopReturn(7));         // Expect 7
         self.v = 10;
         dump(self.getDouble());           // Expect 20
    }
}
