struct ComplexStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Cell;
    g: Slice;
    h: Address;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Address?;
}

contract TestContract {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            a: 0,
            b: false,
            c: null,
            d: null,
            e: "",
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: myAddress(),
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }

    receive() {
        self.data = self.data;
    }
}