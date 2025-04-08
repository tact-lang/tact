struct InnerMost { x: Int }

struct Middle { inner: InnerMost }

struct Outer {
    middle1: Middle;
    middle2: Middle;
    flag: Bool;
}

contract NestedComplex {
    data: Outer;

    init() {
        self.data = Outer{
            middle1: Middle{ inner: InnerMost{ x: 1 } },
            middle2: Middle{ inner: InnerMost{ x: 2 } },
            flag: true,
        };
    }
}