struct Pair {
    a: Int;
    b: Int;
}

contract Test {
    // Getter returning an optional Pair with different return paths
    get fun getOptionalPair(flag: Bool): Pair? {
         if (flag) {
              return null;
         }
         return Pair{ a: 5, b: 6 };
    }

    // Function with explicit return paths using while loop and nested blocks
    fun complexReturn(x: Int): Int {
         let i = x;
         while (i > 0) {
              if (i == 3) {
                   {  // nested block
                        return i * 10;
                   }
              }
              i = i - 1;
         }
         if (x < 0) {
              return 0;
         } else {
              return x + 1;
         }
    }

    // Function using ternary operator in return expression
    fun ternaryReturn(flag: Bool): Int {
         return flag ? 10 : 20;
    }

    // Function returning Unit explicitly
    fun returnUnit() {
         return;
    }

    // Receiver with return in an early branch
    receive () {
         if (false) {
              return;
         }
         // Normal processing
    }
}
