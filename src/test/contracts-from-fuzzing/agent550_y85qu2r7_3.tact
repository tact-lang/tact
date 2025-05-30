struct Inner {
    a: Int;
}

struct Middle {
    inner: Inner;
    val: Int?;
}

struct Outer {
    m1: Middle;
    m2: Middle;
    extra: Int;
}

contract DeepNest {
    o: Outer;

    init() {
        self.o = Outer{
            m1: Middle{ inner: Inner{a:1}, val:null },
            m2: Middle{ inner: Inner{a:2}, val:null },
            extra: 3,
        };
    }
}