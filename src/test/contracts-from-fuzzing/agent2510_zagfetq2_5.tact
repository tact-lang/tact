struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Slice;
    f: Cell;
    g: Address;
    h: String?;
    i: Bool?;
}

contract MixedTypes {
    data: BigStruct;
    init() {
        self.data = BigStruct{
            a: 42,
            b: true,
            c: "hello",
            d: null,
            e: emptyCell().asSlice(),
            f: emptyCell(),
            g: myAddress(),
            h: null,
            i: null
        };
    }
}