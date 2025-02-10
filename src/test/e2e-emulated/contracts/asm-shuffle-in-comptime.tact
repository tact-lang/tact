asm(other self) extends fun testFunc2(self: Int, other: String) { 2 BLKDROP }
asm(nullable other self) extends fun testFunc3(self: Int, other: String, nullable: Bool?): Bool? { 2 BLKDROP }

contract Test {
    receive() {}

    get fun foo(a: Int): Int {
        a.testFunc2("hello");
        if (a.testFunc3("hello", null) == null && a != 100) {
            return a + 10;
        }
        return a;
    }
}
