fun testEarlyReturnInsideTry(): Int {
   try {
      repeat (5) {
         if (true) {
            return 99;
         }
      }
      return 0;
   } catch (_) {
      return -1;
   }
}

fun testMultipleNestedTryCatch(flag: Bool): Int {
   try {
      try {
         if (flag) {
            throw(11);
         }
         return 1;
      } catch (e) {
         if (flag) {
            return e + 100; // if flag true, returns 11 + 100 = 111
         } else {
            throw(e + 1000);
         }
      }
   } catch (e) {
      return e + 10000;
   }
}

fun testThrowIfFalse(): Int {
   try {
      throwIf(500, false);
      return 10;
   } catch (e) {
      return e;
   }
}

fun testThrowUnlessTrue(): Int {
   try {
      throwUnless(600, true);
      return 20;
   } catch (e) {
      return e;
   }
}

fun testLoopWithNestedTry(): Int {
   let sum: Int = 0;
   repeat (4) {
      try {
         if (sum == 1) {
            throw(5);
         }
         sum = sum + 1;
      } catch (e) {
         sum = sum + e;
      }
   }
   return sum;
}

fun main() {
   dump(testEarlyReturnInsideTry());            // Expected: 99
   dump(testMultipleNestedTryCatch(true));        // Expected: 111
   dump(testMultipleNestedTryCatch(false));       // Expected: 1
   dump(testThrowIfFalse());                      // Expected: 10
   dump(testThrowUnlessTrue());                     // Expected: 20
   dump(testLoopWithNestedTry());                   // Expected: 8
}
