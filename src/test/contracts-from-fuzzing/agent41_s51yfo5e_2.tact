contract TestPrimitive {
    fun test() {
        // Test Int operations
        let a: Int = 42;
        let b: Int = -42;
        dump(a + b); // should dump 0

        // Test Bool operations
        let cond: Bool = true && false;
        dump(cond); // should dump false

        // Test String
        let s: String = "hello";
        dump(s); // should dump "hello"

        // Test conversion of String to Cell via asComment()
        let c: Cell = s.asComment();
        dump(c);
    }
    
    receive() { self.test(); }
}
