struct TupleValue { a: Int; b: Int }

fun testRegularReturn(x: Int): Int {
    if (x >= 0) {
         return x;
    } else {
         return -x;
    }
}

fun loopReturn(): Int {
    repeat (3) {
         if (true) { 
              return 555;
         }
    }
    return 0;
}

contract ReturnTestContract {
    v: Int;
    
    init() {
         self.v = 42;
    }
    
    get fun getTuple(): TupleValue {
         if (self.v > 40) {
              return TupleValue { a: self.v, b: self.v - 10 };
         } else {
              return TupleValue { a: 0, b: 0 };
         }
    }
    
    receive () {
         return;
    }
}

fun testConditionalReturn(x: Int): Int {
    if (x < 10) { 
         return x + 10;
    } else {
         return x - 10;
    }
}

fun main() {
    dump(testRegularReturn(5));    // Expected output: 5
    dump(testRegularReturn(-3));   // Expected output: 3
    dump(loopReturn());            // Expected output: 555
    dump(testConditionalReturn(8));  // Expected output: 18
    dump(testConditionalReturn(15)); // Expected output: 5
    
    // Note: Getter 'getTuple' belongs to a contract and cannot be invoked from main.
    // Receiver function in ReturnTestContract is tested for proper compile-time enforcement.
}
