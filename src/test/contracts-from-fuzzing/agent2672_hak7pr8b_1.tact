struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Address?;
    l: Slice?;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct {
            a: 1,
            b: true,
            c: "test",
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice(),
            g: null,
            h: false,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}