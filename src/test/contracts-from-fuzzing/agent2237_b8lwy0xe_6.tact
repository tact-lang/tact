struct SerialLayout {
    a: Int as int64;
    b: Int as uint8;
    c: Bool;
    d: String;
    e: Cell;
}

contract SerialLayoutTest {
    s: SerialLayout;

    init() {
        self.s = SerialLayout{
            a: 123456789,
            b: 255,
            c: true,
            d: "serialize",
            e: emptyCell()
        };
    }
}