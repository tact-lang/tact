contract TestUnaryOperators {
    receive() {
        // Negate operator: -(-1) should result in 1
        let a: Int = -(-1);
        
        // Logical inverse operator: !true should yield false
        let b: Bool = !true;
        
        // Bitwise NOT: ~42 should yield -43
        let c: Int = ~42;
        
        dump(a);
        dump(b);
        dump(c);
    }
}
