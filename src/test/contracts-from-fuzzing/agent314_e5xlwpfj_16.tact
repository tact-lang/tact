struct Inner {
    x: Int;
    y: Bool;
}

struct Middle {
    i1: Inner;
    i2: Inner;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract TestContract {
    nestedStructs: Outer;

    init() {
        self.nestedStructs = Outer{
            m1: Middle{
                i1: Inner{x:1,y:true},
                i2: Inner{x:2,y:false}
            },
            m2: Middle{
                i1: Inner{x:3,y:true},
                i2: Inner{x:4,y:false}
            }
        };
    }
}