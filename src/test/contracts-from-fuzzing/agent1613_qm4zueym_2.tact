struct Inner {
    a: Int;
    b: Int?;
    c: String;
}

struct Outer {
    d: Inner;
    e: Int?;
    f: String;
}

contract NestTest {
    s: Outer;

    init() {
        self.s = Outer{
            d: Inner{
                a: 1,
                b: null,
                c: "hello",
            },
            e: null,
            f: "world",
        };
    }
}