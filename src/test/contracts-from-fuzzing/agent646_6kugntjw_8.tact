struct Inner {
    a: Int;
    b: Bool?;
}

struct Middle {
    c: String?;
    d: Inner;
}

struct Outer {
    e: Middle;
    f: String;
}

contract NestTest {
    data: Outer;

    init() {
        self.data = Outer{
            e: Middle{
                c: null,
                d: Inner{ a: 5, b: null }
            },
            f: "hello"
        };
    }
}