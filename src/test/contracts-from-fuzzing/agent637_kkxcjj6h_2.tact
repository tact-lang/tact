struct Inner {
    num: Int = 1;
}

struct Outer {
    inner: Inner = Inner{};
}

contract Test {
    outer: Outer = Outer{ inner: Inner{} };
    init() {}
    receive() {}
}