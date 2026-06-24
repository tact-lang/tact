contract FuzzGetterOptions {
    // Field variables
    x: Int = 4;
    y: Int = 5;
    
    // Getter that returns an optional Int: if x > y, returns the sum, otherwise null
    get fun optionalSum(): Int? {
         if (self.x > self.y) {
             return self.x + self.y;
         }
         return null;
    }
}

contract FuzzReceiverReturn {
    // Receiver function testing: receivers should allow 'return' without error
    receive() {
         if (true) {
             return;
         }
         // Unreachable code omitted
    }
}

// An assembly function that returns a constant value
asm fun getAnswer(): Int { 42 INT }

contract FuzzAssemblyReturn {
    // A regular function that calls the assembly function and returns its result
    fun testAssembly(): Int {
         return getAnswer();
    }
}

contract FuzzReturnParentheses {
    // Testing return expressions with extra parentheses
    fun parenReturn(x: Int): Int {
         return ((x + 10));
    }
}
