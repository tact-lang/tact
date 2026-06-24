struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    i1: Inner;
    i2: Inner;
}

contract NestedOpts {
    o: Outer;

    init() {
        self.o = Outer{
            i1: Inner{ a:1, b:true },
            i2: Inner{ a:2, b:null }
        };
    }
}