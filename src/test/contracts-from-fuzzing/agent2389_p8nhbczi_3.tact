struct InnerMost {
    z: Int;
    opt: Int?;
}

struct Middle {
    inner: InnerMost;
    v: Int?;
}

struct Outer {
    val: Int;
    nested: Middle;
}

contract Nesting {
    out: Outer;

    init() {
        self.out = Outer{
            val: 5,
            nested: Middle{
                inner: InnerMost{
                    z: 10,
                    opt: null,
                },
                v: null,
            },
        };
    }
}