struct Inner {
    x: Int;
    flag: Bool;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    optOuter: Outer? = null;
    receive() {}
}