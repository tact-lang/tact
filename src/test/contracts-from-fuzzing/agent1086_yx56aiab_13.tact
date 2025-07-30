struct Compose {
    a: Int?;
    b: String;
    c: Bool;
    d: Address?;
    e: Cell;
    f: Bool?;
    g: Int;
}

contract ComposeContract {
    composed: Compose;

    init() {
        self.composed = Compose{
            a: null,
            b: "hello",
            c: true,
            d: null,
            e: emptyCell(),
            f: null,
            g: 42
        };
    }
}