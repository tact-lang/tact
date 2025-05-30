// Test for Primitive Types
contract TestPrimitive() {
    receive() {
        // Integer arithmetic
        let a: Int = 42;
        let b: Int = 1_000;
        dump(a + b); // Expected output: 1042

        // Boolean value
        let boolVal: Bool = true && false;
        dump(boolVal); // Expected output: false

        // String literal
        let s: String = "Hello, 🦄!";
        dump(s); // Expected output: Hello, 🦄!

        // Cell from a string
        let c: Cell = "Test".asComment();
        dump(c); // Expected: Cell representation

        // Address and parsing its workchain value
        let addr: Address = myAddress();
        let std: StdAddress = parseStdAddress(addr.asSlice());
        dump(std.workchain); // Expected output: typically 0
    }
}
