struct Inner {
    x: Int;
    y: String;
}

struct Mid {
    i1: Inner;
    i2: Inner;
}

struct Outer {
    m: Mid;
}

contract NestedMultiLevel {
    o: Outer;

    init() {
        self.o = Outer{
            m: Mid{
                i1: Inner{ x:1,y:"a" },
                i2: Inner{ x:2,y:"b" },
            },
        };
    }
}