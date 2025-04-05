struct Constants { a: Int; b: Int; }

contract Test {
    // Constant evaluation using compile-time functions
    const A: Int = ascii("⚡");           // expected to compute a 3-byte ascii value
    const B: Int = ton("1");              // expected to compute 1_000_000_000

    // Getter to expose the evaluated constants
    get fun getConstants(): Constants {
         return Constants { a: self.A, b: self.B };
    }

    // Dummy receiver
    receive() { return; }
}
