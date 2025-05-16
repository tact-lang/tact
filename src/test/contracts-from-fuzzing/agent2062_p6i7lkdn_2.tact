struct Inner {
    x: Int;
}

struct Middle {
    inner: Inner;
    val: Int?;
}

struct Outer {
    mid: Middle;
    y: Bool;
}

contract NestedStructs {
    s: Outer;

    init() {
        self.s = Outer{
            mid: Middle{
                inner: Inner{x: 42},
                val: null,
            },
            y: true,
        };
    }
}