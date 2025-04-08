struct InnerMost {
    v: Int;
}

struct Mid1 {
    inner: InnerMost;
}

struct Mid2 {
    inner: Mid1;
}

struct Mid3 {
    inner: Mid2;
}

contract DeepDeep {
    data: Mid3;
    init() {
        self.data = Mid3{ inner: Mid2{ inner: Mid1{ inner: InnerMost{ v: 99 } } } };
    }
}