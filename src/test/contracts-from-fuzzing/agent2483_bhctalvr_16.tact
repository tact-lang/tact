struct Deep {
    val: Int = 10;
}

struct Inner {
    deep: Deep? = null;
}

struct Outer {
    inner: Inner? = null;
}

contract TestContract {
    nestedOpt: Outer = Outer{};
    init() {}
}