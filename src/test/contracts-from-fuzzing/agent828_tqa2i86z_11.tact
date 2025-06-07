struct MixedBag {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Address?;
}

contract TestContract {
    store: MixedBag;

    init() {
        self.store = MixedBag{
            a: 100,
            b: true,
            c: "hello",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: null,
            h: false,
            i: "world",
            j: myAddress()
        };
    }
}