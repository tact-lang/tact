struct InnerMost {
    b1: Bool;
    b2: Bool;
    b3: Bool;
}

struct Inner {
    i1: Int;
    i2: Int?;
    innerMost: InnerMost;
}

struct Outer {
    flag: Bool;
    inner: Inner;
}

contract ThreeDeepStruct {
    data: Outer;

    init() {
        self.data = Outer{
            flag: true,
            inner: Inner{
                i1: 111,
                i2: null,
                innerMost: InnerMost{
                    b1: true,
                    b2: false,
                    b3: true
                }
            }
        };
    }
}