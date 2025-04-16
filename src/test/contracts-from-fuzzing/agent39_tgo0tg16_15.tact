contract TestTernary {
    receive() {
        let a: Int = true ? 10 : 20;
        dump(a); // expected: 10
        
        let b: Int = false ? 10 : 20;
        dump(b); // expected: 20
        
        // Nested ternary in alternative case, note extra parentheses for consequence:
        let c: Int = 1 + (false ? 1 : (true ? 2 : 3));
        dump(c); // expected: 1 + 2 = 3
    }
}
