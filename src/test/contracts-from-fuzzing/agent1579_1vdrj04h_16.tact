struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    x: Inner;
    y: Bool;
}

struct Outer {
    m: Middle;
    z: Int;
}

contract NestedComplex {
    val: Outer;
    init() {
        self.val = Outer{
            m: Middle{
                x: Inner{ a:1, b:true },
                y: false
            },
            z: 42
        };
    }
}