struct InnerMost {
    v: Int;
}

struct Mid {
    inner: InnerMost;
}

struct Outer {
    mid: Mid;
}

contract InitDefaults {
    data: Outer;
    init() {
        self.data = Outer{ mid: Mid{ inner: InnerMost{ v: 77 } } };
    }
}