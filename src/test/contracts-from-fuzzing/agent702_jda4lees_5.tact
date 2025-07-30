struct Inner {
    val: Int;
}

struct Outer {
    innerOpt: Inner? = null;
}

contract TestNestedOptDefaults {
    outer: Outer = Outer{};
    init() {
        // no assignment needed
    }
}