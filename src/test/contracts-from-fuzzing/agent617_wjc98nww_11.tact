struct Inner1 {
    value: Int;
}

struct Inner2 {
    nested: Inner1;
}

struct Outer {
    inner: Inner2?; // optional nested struct
}

contract OptionalDeep {
    prop: Outer;
    init() {
        self.prop = Outer{ inner: null };
    }
}
