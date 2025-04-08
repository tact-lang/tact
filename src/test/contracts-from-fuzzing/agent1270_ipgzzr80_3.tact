struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: false,
            c: "x",
            d: 2,
            e: true,
            f: "y",
            g: 3,
            h: false
        };
    }
}