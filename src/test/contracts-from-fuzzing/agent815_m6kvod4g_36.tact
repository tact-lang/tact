contract NestedStructsOpt {
    a: A?;

    init() {
        self.a = null;
    }
}

struct A { b: Int; c: Bool; }