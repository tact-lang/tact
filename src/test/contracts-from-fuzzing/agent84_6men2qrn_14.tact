struct BigStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Bool?;
    h: String?;
    i: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract BigStructTest {
    storage: BigStruct;

    init() {
        self.storage = BigStruct{
            a: 1,
            b: false,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "str",
            g: null,
            h: null,
            i: InnerStruct{
                x: 42,
                y: true,
            },
        };
    }
}