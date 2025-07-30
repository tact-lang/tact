contract TestPrimitiveValid {
    // Test valid usage of primitive types
    fun run() {
        // Valid assignments for basic primitive types as per documentation
        let a: Int = 42;
        let b: Bool = true;
        let c: Cell = emptyCell();
        let s: String = "hello";
        dump(a);
        dump(b);
        dump(s);
    }
    receive() {
        self.run();
    }
}
