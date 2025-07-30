struct Inner {
    a: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
    b: Bool;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
               inner: Inner{ a: 1 }
            },
            b: false
        };
    }
}