struct TestTuple {
    a: Int;
    b: Int;
}

contract ReturnFuzzValid {
    v: Int = 0;

    // f1: simple constant return
    fun f1(): Int {
         return 42;
    }

    // f2: return from nested block
    fun f2(): Int {
         {
             let x: Int = 10;
             if (x > 5) {
                 return x;
             }
         }
         return 0;
    }

    // f3: early return within repeat loop
    fun f3(): Int {
         let i: Int = 0;
         repeat (5) {
             i += 1;
             if (i == 3) {
                 return i;
             }
         }
         return i;
    }

    // f4: void function with explicit return
    fun f4() {
         return;
    }

    // f6: multiple branches with identical return type
    fun f6(): Int {
         if (true) {
             return 7;
         } else {
             return 7;
         }
    }

    // Getter that modifies state
    get fun inc(): Int {
         self.v += 1;
         return self.v;
    }

    // Getter returning a struct as a tuple substitute
    get fun testGetter(): TestTuple {
         if (self.v % 2 == 0) {
             return TestTuple{ a: self.v, b: self.v + 100 };
         } else {
             return TestTuple{ a: self.v, b: self.v - 100 };
         }
    }

    // Receiver with explicit return
    receive(msg: Slice) {
         return;
    }
}
