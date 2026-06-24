fun testTryCatch(cond: Bool): Int {
    if (cond) {
       try {
          throw(101);
       } catch (err) {
          return err;
       }
    } else {
       return 42;
    }
}

fun testNestedTryCatch(divisor: Int): Int {
    if (divisor == 0) {
       try {
          throw(404);
       } catch (innerErr) {
          try {
             throw(innerErr + 1);
          } catch (outerErr) {
             return outerErr;
          }
       }
    } else {
       return 100 / divisor;
    }
}

fun testNoThrow(): Int {
    try {
         return 42;
    } catch (err) {
         return -1;
    }
}
