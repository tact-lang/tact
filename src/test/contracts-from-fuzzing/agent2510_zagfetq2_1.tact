struct Inner {
    a: Int;
}

struct Middle {
    inner: Inner;
    b: Bool;
}

struct Outer {
    middle: Middle;
    c: String;
}

contract NestedStructs {
    data: Outer;
    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{ a: 12 },
                b: true
            },
            c: "test"
        };
    }
}