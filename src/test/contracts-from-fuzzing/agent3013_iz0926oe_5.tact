struct InnerMost {
    flag: Bool;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    middle: Middle?;
}

contract NestedNulls {
    data: Outer;

    init() {
        self.data = Outer{middle: null};
    }
}
