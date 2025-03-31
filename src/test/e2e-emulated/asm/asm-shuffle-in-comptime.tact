asm(other self) extends fun testFunc2(self: Int, other: String) { 2 BLKDROP }
asm(nullable other self) extends fun testFunc3(self: Int, other: String, nullable: Bool?): Bool? { 2 BLKDROP }

// comptime optimization only works for methods with one argument, so this method will be skipped
asm(val2 val1 self) extends fun storeTwo(self: Builder, val1: Bool, val2: Int): Builder {
    DUMPSTK
    1 STI   // val1 into self
    256 STI // val2 into self
}

contract Test {
    receive() {}

    get fun foo(a: Int): Int {
        a.testFunc2("hello");
        if (a.testFunc3("hello", null) == null && a != 100) {
            return a + 10;
        }
        return a;
    }

    get fun bar(): Int {
         let s = beginCell()
            .storeBool(true)
            .storeInt(0, 257)
            .asSlice();

        let c = beginCell()
            .storeTwo(s.loadBool(), s.loadInt(257))
            .endCell();
        return c.depth() // just to keep the code above
    }
}
