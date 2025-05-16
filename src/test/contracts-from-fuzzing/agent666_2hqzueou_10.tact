struct Stuff {
    a: String;
    b: Int?;
    c: Bool;
    d: Address?;
    e: Cell;
    f: Slice?;
    g: Int;
}

contract MixedTypes {
    s: Stuff;

    init() {
        self.s = Stuff{
            a: "hey",
            b: null,
            c: false,
            d: null,
            e: emptyCell(),
            f: null,
            g: 42
        };
    }
}