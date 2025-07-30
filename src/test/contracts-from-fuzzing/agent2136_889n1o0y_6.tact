struct Inner {
    z: Int?;
}

struct Outer {
    x: Int;
    y: Inner;
}

contract TestContract {
    s: Outer? = null;

    init() {}
}