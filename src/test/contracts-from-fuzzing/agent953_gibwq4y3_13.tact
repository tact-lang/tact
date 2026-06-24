struct Inner {
    value: Int = 7;
}

struct Outer {
    inner: Inner? = null;
}

contract Test {
    out: Outer? = null;
}