struct Inner {
    i: Int;
    b: Bool;
}

struct Middle {
    x: Inner;
    y: Inner;
}

struct Outer {
    m: Middle;
    mOpt: Middle?;
}

contract TestNested {
    field: Outer;

    init() {
        self.field = Outer {
            m: Middle{ x: Inner{ i:1, b:true }, y: Inner{ i:2, b:false } },
            mOpt: Middle{ x: Inner{ i:3, b:false }, y: Inner{ i:4, b:true } }
        };
    }
}