contract NestedStructWithDefaults {
    struct1: Inner1;

    init() {
        self.struct1 = Inner1{a: 5, optB: null};
    }
}

struct Inner1 {
    a: Int;
    optB: Int? = null;
}