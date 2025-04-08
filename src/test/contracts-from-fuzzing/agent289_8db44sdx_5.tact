struct Inner {
    a: Int = 123;
}

struct Outer {
    inner: Inner? = null;
}

contract TestContract {
    myData: Outer = Outer{};
    receive() {}
}