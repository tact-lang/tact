struct LongStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Int;
    h: Bool;
    i: String;
    j: Address;
    k: Slice;
    l: Cell;
}

contract TestContract {
    s: LongStruct;

    init() {
        self.s = LongStruct{
            a: 1,
            b: false,
            c: "a",
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: emptyCell(),
            g: 2,
            h: true,
            i: "b",
            j: myAddress(),
            k: emptyCell().asSlice(),
            l: emptyCell(),
        };
    }

    receive() {
        let _ = self.s.g + 3;
    }
}