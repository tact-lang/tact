contract TestLogicalAugAssign {
    receive() {
        // Test logical augmented assignment operators (available since Tact 1.6)
        // Logical AND augmented assignment
        let a: Bool = false;
        a &&= true;       // This should compute a = a && true, which remains false
        dump(a);         
        
        // Logical OR augmented assignment
        let b: Bool = false;
        b ||= true;       // This should compute b = b || true, which becomes true
        dump(b);
    }
}
