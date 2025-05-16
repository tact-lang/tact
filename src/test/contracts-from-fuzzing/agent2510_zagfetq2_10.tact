struct LargeNested {
    a: Int;
    b: String;
    c: Bool;
    d: Inner1;
    e: Inner2;
}

struct Inner1 {
    x: Int;
    y: String;
}

struct Inner2 {
    p: Bool;
    q: Int?;
    r: Inner3;
}

struct Inner3 {
    m: Int;
    n: Bool;
}

contract ComplexNested {
    data: LargeNested;
    init() {
        self.data = LargeNested{
            a: 1,
            b: "hello",
            c: true,
            d: Inner1{ x: 2, y: "world" },
            e: Inner2{ p: false, q: null, r: Inner3{ m: 3, n: true } }
        };
    }
}