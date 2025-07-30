struct Reordered {
    a: Int;
    b: String;
    c: Bool;
    d: Int;
    e: String;
    f: Bool;
}

contract FieldOrder {
    f1: Int;
    f2: Reordered;
    init() {
        self.f1 = 123;
        self.f2 = Reordered{
            a: 1,
            b: "hi",
            c: true,
            d: 2,
            e: "hello",
            f: false
        };
    }
}