struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
}

contract TestContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: 2,
            h: false,
            i: null,
            j: null
        };
    }
}