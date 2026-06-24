struct ManyBoolInts {
    a: Bool;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
}

contract TestContract {
    data: ManyBoolInts;

    init() {
        self.data = ManyBoolInts {
            a: true,
            b: false,
            c: 10,
            d: true,
            e: 20,
            f: false,
            g: 30,
        };
    }
}