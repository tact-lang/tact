contract NestedStructOptionalDefault {
    s: S? = null;

    init() {
        self.s = null;
    }
}

struct S {
    a: Int;
}