contract TestBitwiseNot {
    receive() {
        // Test integer bitwise NOT operator
        let a: Int = ~42; // expected: -43
        dump(a);
        
        // Test double application returning original value
        let b: Int = ~(~42); // expected: 42
        dump(b);
    }
}
