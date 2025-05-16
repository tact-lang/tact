struct HasManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: String?;
    e: Address;
    f: Cell;
    g: Slice;
    h: Int?;
    i: Bool?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract Complex {
    f: HasManyFields;

    init() {
        self.f = HasManyFields{
            a: 1,
            b: false,
            c: "hello",
            d: null,
            e: myAddress(),
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}