struct One { number: Int; }

contract StructsTest() {
    // This contract tests struct conversion to and from Cell.
    fun testStruct(): Bool {
         let s: One = One { number: 50 };
         let cell = s.toCell();
         let s2: One = One.fromCell(cell);
         return s2.number == 50;
    }

    receive() {
         dump(self.testStruct());
    }
}
