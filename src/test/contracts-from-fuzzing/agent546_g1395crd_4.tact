struct Inner {
    x: Int;
    y: String?;
    flag: Bool;
}

struct Middle {
    a: Inner;
    b: Inner?;
}

struct Outer {
    m: Middle;
    optM: Middle?;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{
                a: Inner{ x: 1, y: null, flag: true },
                b: null
            },
            optM: null
        };
    }
}