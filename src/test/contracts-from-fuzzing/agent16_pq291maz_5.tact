contract TestControlFlow1 {
    // Test 1: Simple if/else with return
    fun absolute(a: Int) : Int {
        if (a >= 0) {
            return a;
        } else {
            return -a;
        }
    }

    receive() {}
}

contract TestControlFlow2 {
    // Test 2: try/catch with conditional throw to avoid unreachable code error
    fun testThrowCatch() : Int {
         if (true) {
             try {
                 // Using a conditional throw to avoid static unreachable code
                 if (true) { throw(101); } else { }
                 return 0;
             } catch (err) {
                 return err; 
             }
         } else {
             return -1;
         }
    }

    receive() {}
}

contract TestControlFlow3 {
    // Test 3: Nested try/catch
    fun nested() : Int {
         try {
             try {
                 throw(111);
             } catch (err) {
                 return err + 1;
             }
         } catch (outer) {
             return outer;
         }
    }

    receive() {}
}

contract TestControlFlow4 {
    // Test 4: Multibranch function with try/catch in branches
    fun compute(x: Int) : Int {
         if (x == 0) {
             try {
                 if (x == 0) { throw(999); } else { }
             } catch (e) {
                 return e;
             }
         } else {
             try {
                 if (x < 0) { throw(100); }
                 return x * 2;
             } catch (e) {
                 return 0;
             }
         }
         return -1;
    }

    receive() {}
}

contract TestControlFlow5 {
    // Test 5: Nested try/catch with rethrowing from inner catch
    fun rethrow(): Int {
       try {
         try {
           if (true) { throw(50); } else { }
         } catch (e) {
           throw(e + 1);
         }
       } catch (e2) {
         return e2;
       }
       return -1;
    }

    receive() {}
}

contract TestControlFlow6 {
    // Test 6: Discard catch value using wildcard
    fun discardCatch(): Int {
       try {
         if (true) { throw(60); } else { }
       } catch (_) {
         return 60;
       }
       return 0;
    }

    receive() {}
}

contract TestControlFlow7 {
    // Test 7: Multi-branch control flow with try/catch inside if-else
    fun multiBranch(x: Int) : Int {
         if (x > 10) {
             return 1;
         } else if (x == 10) {
             try {
                 if (true) { throw(10); } else { }
                 return 0;
             } catch (err) {
                 return err;
             }
         } else {
             return 0;
         }
    }

    receive() {}
}

contract TestControlFlow8 {
    // Test 8: Loop with try/catch inside repeat loop
    fun loopWithTry(n: Int) : Int {
         let mutable_sum: Int = 0;
         let mutable_i: Int = 0;
         repeat (n) {
             try {
                 if (mutable_i == 2) { throw(5); }
                 mutable_sum = mutable_sum + mutable_i;
             } catch (e) {
                 mutable_sum = mutable_sum + e;
             }
             mutable_i = mutable_i + 1;
         }
         return mutable_sum;
    }

    receive() {}
}

contract TestControlFlowReceiver1 {
    // Test 9: Receiver with try/catch
    receive() {
         if (true) {
             try {
                 if (false) { throw(123); } else { }
             } catch (err) {
                 // Intentionally empty
             }
             return;
         }
         return;
    }
}

contract TestControlFlowReceiver2 {
    // Test 10: Receiver with nested control flow and try/catch
    receive() {
         if (sender() == myAddress()) {
             try {
                 if (false) { throw(321); } else { }
             } catch (_) {
                 // Ignore error
             }
             return;
         } else {
             return;
         }
    }
}
