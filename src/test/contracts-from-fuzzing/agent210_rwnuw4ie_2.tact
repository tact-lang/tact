struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Bool?;
    h: Int?;
}

contract TestStorage {
    data: NestedStruct;
    init() {
        self.data = NestedStruct{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: false,
            h: null
        };
    }
}
