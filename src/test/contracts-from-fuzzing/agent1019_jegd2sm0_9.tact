struct Inner {
    val: Int = 1;
}

struct Middle {
    inner: Inner = Inner{};
}

struct Outer {
    middle: Middle = Middle{};
}

contract TestContract {
    outer: Outer = Outer{};

    init() {} 
}