//// Combined Additional Fuzz-Tests for Tact Types and Expressions

// TestMapEquality: shallow equality for maps
contract TestMapEquality {
    fun run() {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        dump(m1 == m2); // expected: true
    }
    receive() { self.run(); }
}

// TestStringAsComment: test conversion of string to cell with asComment
contract TestStringAsComment {
    fun run() {
        let s: String = "Hello, Tact!";
        let c: Cell = s.asComment(); // should prefix with 32 zero bits
        // Load the first 32 bits. They should be 0.
        let bits: Int = c.asSlice().loadUint(32);
        dump(bits); // expected: 0
    }
    receive() { self.run(); }
}

// TestAddressAsSlice: test conversion of Address to Slice
contract TestAddressAsSlice {
    fun run() {
        let addr: Address = myAddress();
        let s: Slice = addr.asSlice();
        // Dump bit count of the slice; it should be greater than 0
        dump(s.bits());
    }
    receive() { self.run(); }
}

// Extension function for converting Int to a coin string
extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

// TestExtensionToCoinsString: test the extension function to convert Int to coins string
contract TestExtensionToCoinsString {
    fun run() {
        dump(5.toCoinsString2()); // expected: "0.000000005" or similar formatting
    }
    receive() { self.run(); }
}

// TestNestedTryCatch: test nested try-catch constructs
contract TestNestedTryCatch {
    fun run() {
        try {
            let xs: Slice = beginCell().storeUint(0, 1).endCell().beginParse();
            let x: Int = xs.loadUint(1); // x is 0
            try {
                throw(101); // throw exit code 101
            } catch (err) {
                // This division by zero should cause an error
                let result: Int = err / x; 
                dump(result);
            }
        } catch (outer) {
            // Expect an error code due to division by zero
            dump(outer);
        }
    }
    receive() { self.run(); }
}

// TestOperatorPrecedence: test operator precedence and associativity
contract TestOperatorPrecedence {
    fun run() {
        let a: Int = 5 + 4 - 5 * 4 / 5 % 4;  // expected: 9 as per docs
        dump(a);
    }
    receive() { self.run(); }
}
