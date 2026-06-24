struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String;
    k: Address;
    l: Cell;
    m: Int;
    n: Bool;
    o: String;
    p: Address;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "hello",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: null,
            j: "world",
            k: myAddress(),
            l: emptyCell(),
            m: 42,
            n: false,
            o: "test",
            p: myAddress()
        };
    }
}