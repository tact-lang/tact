struct Pair { a: Int; b: Int }

contract ReturnTest {
    x: Int;

    init() {
        self.x = 15;
    }

    // Regular function with multiple return paths
    fun regular(x: Int): Int {
        if (x > 0) {
            return x;
        }
        if (x == 0) {
            return 0;
        }
        return -x;
    }

    // Getter function with multiple return paths
    get fun getPair(): Pair {
         if (self.x > 10) {
              return Pair { a: 1, b: 2 };
         } else {
              return Pair { a: 3, b: 4 };
         }
    }

    // Receiver function attempting to use return statement
    receive() {
         // In a receiver, using return without a value should signal end of execution
         return;
    }
}
