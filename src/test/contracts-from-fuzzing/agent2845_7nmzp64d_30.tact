struct WithSerial {
    a: Int as uint4;
    b: Int as int64;
    c: Bool;
    d: String;
    e: Cell;
    f: Slice;
}

contract SerialNestedTest {
    s: WithSerial;

    init() {
        self.s = WithSerial{
            a: 2, b: 42, c: true, d: "S", e: emptyCell(), f: emptyCell().asSlice()
        };
    }
}