struct SerialTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint256;
    d: Bool;
    e: String;
    f: Cell;
}

contract SerialNestedTest {
    st: SerialTest;

    init() {
        self.st = SerialTest{
            a: 5,
            b: -7,
            c: 123456,
            d: false,
            e: "ok",
            f: emptyCell()
        };
    }
}