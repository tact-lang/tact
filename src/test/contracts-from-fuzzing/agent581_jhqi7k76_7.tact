struct Mixed {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
    f: Slice?;
    g: Builder;
}

contract Test {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 1,
            b: null,
            c: "hi",
            d: null,
            e: emptyCell(),
            f: null,
            g: beginCell(),
        };
    }
}
