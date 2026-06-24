struct Inner {
    sub: Bool;
}

struct Middle {
    f1: Int;
    f2: Inner;
}

struct Outer {
    nested1: Middle;
    nested2: Middle;
    nestedOpt: Middle?;
}

contract DeepArray {
    val: Outer;
    
    init() {
        self.val = Outer{
            nested1: Middle{
                f1: 1,
                f2: Inner{sub: true}
            },
            nested2: Middle{
                f1: 2,
                f2: Inner{sub: false}
            },
            nestedOpt: null
        };
    }
}