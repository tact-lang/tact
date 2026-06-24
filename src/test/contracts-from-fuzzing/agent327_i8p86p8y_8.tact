struct Inner {
    req: Int;
    opt: String?;
}

struct Outer {
    a: Int;
    b: Inner;
    c: Inner?;
    d: Bool?;
}

contract NestedOptTest {
    data: Outer = Outer{
        a: 7,
        b: Inner{ req: 1, opt: null },
        c: null,
        d: true
    };
    init() {}
}