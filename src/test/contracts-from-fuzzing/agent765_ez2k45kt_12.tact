struct Inner {
    a: Int;
    b: Int;
}

struct Middle {
    i1: Inner;
    i2: Inner;
}

struct Outer {
    m1: Middle;
    m2: Middle;
    m3: Middle;
}

contract TestContract {
    big: Outer;

    init() {
        self.big = Outer{
            m1: Middle{ i1: Inner{a:1,b:2}, i2: Inner{a:3,b:4} },
            m2: Middle{ i1: Inner{a:5,b:6}, i2: Inner{a:7,b:8} },
            m3: Middle{ i1: Inner{a:9,b:10}, i2: Inner{a:11,b:12} }
        };
    }
}