struct Mix {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
}

contract MixTest {
    st: Mix;

    init() {
        self.st = Mix{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "mix",
            f: null,
            g: emptyCell(),
            h: null,
        };
    }
}
