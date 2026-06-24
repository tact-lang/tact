struct LargeStruct {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Cell;
    i: Slice;
    j: Int;
    k: Bool;
}

contract TestContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: "b",
            c: false,
            d: null,
            e: true,
            f: null,
            g: myAddress(),
            h: emptyCell(),
            i: emptyCell().asSlice(),
            j: 999,
            k: true
        };
    }
}