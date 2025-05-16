struct Mix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int as uint64;
    e: Bool;
    f: String;
    g: Slice;
    h: Cell?;
    i: Builder?;
}

contract TestContract {
    value: Mix;

    init() {
        self.value = Mix{
            a: null,
            b: true,
            c: "opt",
            d: 1234567890,
            e: false,
            f: "req",
            g: emptyCell().asSlice(),
            h: emptyCell(),
            i: beginCell()
        };
    }
}
