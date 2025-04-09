contract TestPow {
    // Test compile-time pow
    const P: Int = pow(2, 3);
    receive() {
        require(self.P == 8, "pow constant evaluation failed: expected 8");
    }
}

contract TestLog2 {
    receive() {
        let v: Int = log2(1024);
        require(v == 10, "log2 constant evaluation failed: expected 10");
    }
}

contract TestIntLiteral {
    const A: Int = 1_000;
    const B: Int = 1000;
    receive() {
        require(self.A == self.B, "Integer literal underscore evaluation failed: expected A == B");
    }
}
