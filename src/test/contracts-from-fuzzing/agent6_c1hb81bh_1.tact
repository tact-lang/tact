struct WideStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: Cell;
    g: String;
    h: Slice;
    i: Builder;
}

contract TestStorage {
    myStorage: WideStruct;

    init() {
        self.myStorage = WideStruct{
            a: 1,
            b: true,
            c: 2,
            d: false,
            e: myAddress(),
            f: emptyCell(),
            g: "Hello",
            h: emptyCell().asSlice(),
            i: beginCell(),
        };
    }
}
