struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Address;
    i: Bool?;
    j: Cell;
}

contract UseLarge {
    data: LargeStruct;
    
    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "world",
            g: null,
            h: myAddress(),
            i: null,
            j: emptyCell(),
        };
    }
}