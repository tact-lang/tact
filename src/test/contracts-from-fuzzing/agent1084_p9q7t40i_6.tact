struct InnerMost {
    val: Int = 1;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract TestContract {
    data: Outer = Outer{ middle: Middle{ inner: InnerMost{} } };
    init() {}
    receive() {}
}