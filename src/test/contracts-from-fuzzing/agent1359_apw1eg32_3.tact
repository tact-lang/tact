struct InnerInner {
    x: Int;
    y: Bool?;
}

struct Inner {
    i1: InnerInner;
    i2: InnerInner?;
}

struct Outer {
    o1: Inner;
    o2: Inner?;
}

contract NestedStructsTest {
    data: Outer;

    init() {
        self.data = Outer{
            o1: Inner{
                i1: InnerInner{x:1,y:true},
                i2: null,
            },
            o2: null
        };
    }
}