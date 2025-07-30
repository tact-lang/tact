struct Inner {
    x: Int = 1;
    y: Bool = true;
}

struct Outer {
    inner: Inner = Inner{};
    z: Int = 5;
}

contract TestContract {
    data: Outer = Outer{};

    receive() {}
}