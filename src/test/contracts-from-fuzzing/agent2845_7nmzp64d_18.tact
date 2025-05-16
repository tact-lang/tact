struct SerialTest {
    i64: Int as int64;
    u8: Int as uint8;
    b: Bool;
    s: String;
    sl: Slice;
    c: Cell;
}

contract SerializationEdgeCase {
    storage: SerialTest;

    init() {
        self.storage = SerialTest{
            i64: 42,
            u8: 255,
            b: false,
            s: "abc",
            sl: emptyCell().asSlice(),
            c: emptyCell(),
        };
    }
}