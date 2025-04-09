struct Inner {
    a: Int;
    b: Int;
}

struct Middle {
    sub1: Inner;
    sub2: Inner;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract MultiNest {
    data: Outer;
    init() {
        self.data = Outer{
            m1: Middle{ sub1: Inner{a:1,b:2}, sub2: Inner{a:3,b:4} },
            m2: Middle{ sub1: Inner{a:5,b:6}, sub2: Inner{a:7,b:8} }
        };
    }
}