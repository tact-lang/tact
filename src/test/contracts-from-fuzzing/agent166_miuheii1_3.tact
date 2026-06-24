struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: String?;
    h: Int?;
    i: Bool?;
    j: Cell?;
    k: Slice?;
    l: Address?;
}

contract ManyFields {
    data: S;

    init() {
        self.data = S{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}