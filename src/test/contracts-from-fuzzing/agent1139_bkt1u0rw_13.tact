struct DeepComplex {
    x: Int;
    y: Nested1;
    z: Nested2;
}

struct Nested1 {
    a: Bool;
    b: Bool?;
    c: Int;
}

struct Nested2 {
    d: Int?;
    e: Bool;
    f: String?;
}

contract PersistDeepComplex {
    s: DeepComplex;
    init() {
        self.s = DeepComplex{
            x: 10,
            y: Nested1{ a: true, b: null, c: 99 },
            z: Nested2{ d: null, e: false, f: null },
        };
    }
}