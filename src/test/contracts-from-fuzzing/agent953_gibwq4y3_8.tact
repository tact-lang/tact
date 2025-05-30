struct Inner {
    value: Int = 10;
}

struct Outer {
    inner: Inner? = null;
}

contract Test {
    field: Outer = Outer{};
}