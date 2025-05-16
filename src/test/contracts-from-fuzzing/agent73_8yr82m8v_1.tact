contract TestPrimitive {
    fun run() {
        let a: Int = 1 + 1;  // Should be 2
        let b: Bool = true && false; // false
        let c: Cell = emptyCell();
        let d: Address = myAddress();
        // Just invoking dump to avoid unused warnings
        dump(a);
        dump(b);
        dump(c);
        dump(d);
    }

    // Dummy receiver to ensure compilation
    receive() { }
}
