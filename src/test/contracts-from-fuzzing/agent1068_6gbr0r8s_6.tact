struct InnerMost {
    value: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    first: Middle;
    second: Middle;
}

contract MultipleNestings {
    storage: Outer;

    init() {
        self.storage = Outer{
            first: Middle{ inner: InnerMost{ value: 100 } },
            second: Middle{ inner: InnerMost{ value: 200 } },
        };
    }
}