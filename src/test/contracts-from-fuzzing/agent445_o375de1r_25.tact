// Deep persistence chain with nested default and optional assignment
struct InnerInner {
    p: Int? = null;
}

struct Inner {
    innerMost: InnerInner? = null;
}

struct Outer {
    inner: Inner? = null;
}

contract NestedComplex {
    persist: Outer = Outer{};
}
