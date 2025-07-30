struct Many {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: String;
    f: Int;
    g: Bool;
}

contract TestContract {
    stuff: Many;

    init() {
        self.stuff = Many{
            a: 1,
            b: false,
            c: 2,
            d: true,
            e: "hello",
            f: 3,
            g: false
        };
    }
}