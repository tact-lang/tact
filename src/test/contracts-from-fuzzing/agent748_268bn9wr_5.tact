struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Slice;
    i: Builder;
    j: Address;
}

contract LargeStructStorage {
    value: LargeStruct;

    init() {
        self.value = LargeStruct{
            a: 10,
            b: true,
            c: "hello",
            d: 42,
            e: false,
            f: "world",
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: beginCell(),
            j: myAddress(),
        };
    }
}
