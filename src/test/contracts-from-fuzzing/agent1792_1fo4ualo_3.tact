struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Cell;
    k: Slice;
    l: Address;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            a: 1,
            b: true,
            c: "a",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: "b",
            j: emptyCell(),
            k: emptyCell().asSlice(),
            l: myAddress(),
        };
    }
}