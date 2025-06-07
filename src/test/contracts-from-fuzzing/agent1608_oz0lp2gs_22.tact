struct InnerMost {
    x: Int;
}

struct Inner {
    a: Int;
    b: InnerMost;
}

struct Outer {
    z: Int;
    i: Inner;
}

contract MultiNested {
    val: Outer;

    init() {
        self.val = Outer{
            z:1,
            i: Inner{
                a:2,
                b: InnerMost{ x:3 }
            }
        };
    }
}