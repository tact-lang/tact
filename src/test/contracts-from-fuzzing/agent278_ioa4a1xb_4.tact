struct LargeStruct {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Int?;
    g: Bool?;
    h: Slice;
    i: String;
    j: Int;
}

contract LargeStructTest {
    state: LargeStruct;

    init() {
        self.state = LargeStruct{
            a: 1,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: "hello",
            f: null,
            g: true,
            h: emptyCell().asSlice(),
            i: "world",
            j: 42
        };
    }
}