struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Cell;
    i: Slice;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null,
            g: myAddress(),
            h: emptyCell(),
            i: emptyCell().asSlice()
        };
    }
}