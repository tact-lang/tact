contract TestPrimitive {
    fun test() {
        // Testing primitive types: Int, Bool, String, Cell
        let a: Int = 5;
        let b: Int = 2;
        let c: Int = a / b; // Expected: 2, floor division

        // Boolean test
        let flag: Bool = (a > b);
        
        // String literal and conversion to Cell
        let s: String = "Test";
        let cell: Cell = s.asComment();
        
        // Dump values for verification (if dumper is used)
        dump(c);
        dump(flag);
        dump(cell);
    }

    receive() {
        self.test();
    }
}
