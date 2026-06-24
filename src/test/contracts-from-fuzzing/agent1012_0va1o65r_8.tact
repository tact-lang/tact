struct Inner {
    i: Int;
}

struct Middle {
    opt: Inner?;
}

struct Outer {
    m: Middle;
}

contract OptDeep {
    o: Outer;

    init() {
        self.o = Outer{
            m: Middle{
                opt: Inner{ i: 7 }
            }
        };
    }
}