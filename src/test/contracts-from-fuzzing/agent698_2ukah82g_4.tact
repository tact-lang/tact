struct InnerMost {
    value: Int?;
}

struct Mid {
    inner: InnerMost;
    flag: Bool;
}

struct Outer {
    mid1: Mid;
    mid2: Mid;
}

contract TestContract {
    store: Outer;

    init() {
        self.store = Outer{
            mid1: Mid{ inner: InnerMost{ value: null }, flag: true },
            mid2: Mid{ inner: InnerMost{ value: 42 }, flag: false },
        };
    }
}