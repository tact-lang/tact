struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice;
    i: Address;
    j: Address?;
}

contract ManyFields {
    data: LargeStruct;
    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "hello",
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: myAddress(),
            j: null
        };
    }
    receive() {
        self.data = self.data;
    }
}