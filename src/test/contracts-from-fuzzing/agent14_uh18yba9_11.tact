struct Inner {
    foo: Int = 5;
    bar: Bool = true;
}

struct Outer {
    s: Inner?; // optional inner struct with defaults
    val: Int = 10;
}

contract OptionalNestedWithInnerDefaults {
    rec: Outer;

    init() {
        self.rec = Outer{};  // omit optional inner, use default val
    }
}