contract TestPrimitive {
    fun test() {
        let a: Int = 10;
        let b: Int = 20;
        let sum: Int = a + b;
        // Expect sum to be 30
        dump(sum);
        
        // Test conversion of string literal to cell via asComment()
        let c: Cell = "hello".asComment();
        dump(c);
    }
    receive() { self.test(); }
}
