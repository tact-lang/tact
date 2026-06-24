struct InnerMost {
    flag: Bool;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    middle: Middle?;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            middle: null, // test outer optional null
        };
    }
}
