struct ReorderTest {
    a: Int;
    b: String;
    c: Int?;
    d: Bool;
}

contract StructReorder {
    s: ReorderTest;

    init() {
        self.s = ReorderTest{
            a:42,
            b:"hi",
            c:null,
            d:true
        };
    }
}