struct InnerMost {
    val: Int;
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

contract QuadNested {
    root: Mid3;

    init() {
        self.root = Mid3{ inner: Mid2{ inner: Mid1{ inner: InnerMost{ val:99 } } } };
    }
}