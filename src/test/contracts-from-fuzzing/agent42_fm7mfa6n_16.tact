contract FuzzReturnsModified {
    // Returns x + 1 directly
    fun directReturn(x: Int): Int {
         return x + 1;
    }

    // Uses a nested block without a trailing semicolon to return x * 2
    fun blockReturnNoSemicolon(x: Int): Int {
         { return x * 2 }
    }

    // Uses a nested block that returns x + 5 if x > 5, else returns 0
    fun nestedBlockReturn(x: Int): Int {
         if (x > 5) { { return x + 5 } }
         return 0;
    }

    // Two distinct return paths
    fun differentReturn(a: Bool): Int {
         if (a) {
             return 1;
         } else {
             return 2;
         }
    }

    // Field for getter testing
    x: Int = 3;

    // Getter that returns the square of x using a nested block without semicolon
    get fun square(): Int {
         { return self.x * self.x }
    }
}
