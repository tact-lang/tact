contract TestBooleanExpressions() {
    fun run() {
        // Test boolean expressions: &&, ||, !
        let a: Bool = (true || false) && !false; // Expected: true
        dump(a);
    }
    
    receive() {
        self.run();
    }
}
