struct Inner {
    val: Int;
}

struct Wrapper {
    nestedOpt: Inner?;
}

contract TestContract {
    wrap: Wrapper = Wrapper{ nestedOpt: null };
    init() {}
}