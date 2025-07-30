struct Nested {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
}

contract TestContract {
    many: Nested;

    init() {
        self.many = Nested{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: 42,
            f: true,
            g: null,
        };
    }
}