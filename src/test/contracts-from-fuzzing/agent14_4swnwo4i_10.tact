//// Updated TestRawSlice: Instead of converting Slice to Cell (which is not permitted), we print the number of bits remaining in the Slice

contract TestRawSlice {
    fun run() {
        let s: Slice = rawSlice("000DEADBEEF000");
        let bitCount: Int = s.bits();
        dump(bitCount); // expected: prints bit count of the raw slice
    }
    receive() { self.run(); }
}

//// Continue with additional fuzz tests below

// Test Nested Optionals: with an optional inside a struct
struct NestedOptional {
    inner: Int?;
}

contract TestNestedOptional {
    fun run() {
        let no: NestedOptional = NestedOptional{ inner: null };
        // Assert that inner is null; if not, dump 1, else dump 0
        if (no.inner != null) {
            dump(1);
        } else {
            dump(0); // expected output: 0
        }
    }
    receive() { self.run(); }
}

// Test multiple unsupported assignment: assigning non-convertible types
contract TestInvalidAssignment {
    fun run() {
        // Expected compile error: cannot assign Cell to Int
        // Uncomment the following line to trigger compile error (and thus not run in production):
        // let x: Int = emptyCell();
    }
    receive() { self.run(); }
}

// Test arithmetic with negative and large numbers
contract TestLargeArithmetic {
    fun run() {
        let a: Int = 2^256; // using ^ operator as power, though might need to use exponentiation function or literal
        // Because Tact integer arithmetic uses 257-bit signed integers, this will test overflow behavior
        // However, Tact does not throw overflow errors in runtime arithmetic because all ints are 257 bits
        dump(a);
        let b: Int = (-3) / 2;       // expected: -2
        dump(b);
    }
    receive() { self.run(); }
}
