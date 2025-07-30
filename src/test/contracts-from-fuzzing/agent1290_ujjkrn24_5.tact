struct Foo { x: Int; }

contract OptFieldsTest {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;
    optFoo: Foo?;

    init() {
        self.optInt = 42;
        self.optBool = null;
        self.optStr = "hi";
        self.optAddr = null;
        self.optCell = emptyCell();
        self.optFoo = null;
    }
}