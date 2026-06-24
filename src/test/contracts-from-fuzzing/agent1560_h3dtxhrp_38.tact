struct InnerMost {
    deepInt: Int;
}

struct Inner {
    innermost: InnerMost;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    val: Outer = Outer{inner: Inner{innermost: InnerMost{deepInt: 42}}};
}