struct Outer {
    x: Int;
    y: Middle;
}

struct Middle {
    z: Int;
    inner: Inner;
}

struct Inner {
    w: Int;
    more: MoreInner;
}

struct MoreInner {
    deep: Int;
    optional: Int?;
}

contract DeeplyNested {
    data: Outer;
    init() {
        self.data = Outer{
            x: 1,
            y: Middle{
                z: 2,
                inner: Inner{
                    w: 3,
                    more: MoreInner{
                        deep: 4,
                        optional: null
                    }
                }
            }
        };
    }
}
