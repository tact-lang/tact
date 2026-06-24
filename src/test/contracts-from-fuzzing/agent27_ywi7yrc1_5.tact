struct Bigger {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
}

contract ManyPrimitives {
    data: Bigger;

    init() {
        self.data = Bigger{
            a: 1,
            b: false,
            c: "hi",
            d: 2,
            e: true,
            f: "bye",
            g: 3,
        };
    }
}