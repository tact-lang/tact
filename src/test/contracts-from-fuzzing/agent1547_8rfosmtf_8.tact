struct Flat {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
}

contract FlatStructFields {
    f: Flat;

    init() {
        self.f = Flat {
            a: 1,
            b: 2,
            c: false,
            d: "hello"
        };
    }
}