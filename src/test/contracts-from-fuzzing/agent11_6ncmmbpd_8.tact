contract Test {
    receive() {
        // Test basic boolean operations
        let a: Bool = true && false;  // expected false
        let b: Bool = true || false;  // expected true
        let c: Bool = !true;          // expected false
        
        dump(a);
        dump(b);
        dump(c);
    }
}
