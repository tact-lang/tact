struct TupleRet {
    first: Int;
    second: Int;
}

contract Test {
    // Function returns unit (void).
    fun f_unit() {
         return;
    }

    // Function returns Int with early return.
    fun f_int(x: Int): Int {
         if (x < 0) {
             return 0;
         } else {
             if (x > 10) {
                 {  // nested block
                   return x * 2;
                 }
             }
         }
         return x;
    }

    // Function returns Int using a while loop with return inside the loop.
    fun f_loop(n: Int): Int {
         let i = n;
         while (i > 0) {
             if (i % 2 == 0) {
                 return i;
             }
             i = i - 1;
         }
         return -1;
    }

    // Function returning an optional Int.
    fun f_optional(x: Int): Int? {
         if (x == 0) {
             return null;
         }
         return x;
    }

    // Getter with complex return using a struct for tuple-like return.
    get fun get_tuple(flag: Bool): TupleRet {
         if (flag) {
             return TupleRet{ first: 1, second: 2 };
         }
         return TupleRet{ first: 3, second: 4 };
    }

    // Receiver with early return.
    receive () {
         if (1 > 2) {
             return;
         }
         // Continue processing normally
    }
}
