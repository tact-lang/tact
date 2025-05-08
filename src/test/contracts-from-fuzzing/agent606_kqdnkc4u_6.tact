struct Inner {
    foo: Int = 7;
}

struct Outer {
    nested: Inner? = null;
}

contract Test {
    data: Outer = Outer{};
}