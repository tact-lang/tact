struct InnerMost {
    one: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract DeepPersist {
    data: Outer;
    init() {
        self.data = Outer{ mid: Middle{ inner: InnerMost{ one: 77 } } };
    }
}
