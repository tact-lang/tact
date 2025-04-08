struct Inner {
    v: String?;
}

struct Outer {
    inner: Inner;
}

contract NestedDeep {
    o: Outer = Outer{ inner: Inner{ v: null } };

    init() {
        self.o = Outer{ inner: Inner{ v: "abc" } };
    }
}