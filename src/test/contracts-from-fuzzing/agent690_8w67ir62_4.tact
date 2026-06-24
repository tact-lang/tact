struct InnerMost {
    deepVal: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract DeepField {
    storage: Outer;

    init() {
        self.storage = Outer{
            mid: Middle{
                inner: InnerMost{deepVal: 42},
            },
        };
    }
}