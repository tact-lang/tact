struct BigStruct {
    a: Int;
    b: Int?;
    c: String;
    d: Bool;
    e: Cell;
    f: Address;
    g: Slice;
    h: Int;
}

contract BigStructTest {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: null,
            c: "hello",
            d: true,
            e: emptyCell(),
            f: myAddress(),
            g: emptyCell().asSlice(),
            h: 42
        };
    }
}