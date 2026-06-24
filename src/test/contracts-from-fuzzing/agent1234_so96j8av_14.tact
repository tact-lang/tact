struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    mid: Middle;
    flag: Bool;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner1: Inner{ a: 1, b: true },
                inner2: Inner{ a: 2, b: false },
            },
            flag: true,
        };
    }
}