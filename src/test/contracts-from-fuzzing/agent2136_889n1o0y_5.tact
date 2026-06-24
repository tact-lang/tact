struct Inner {
    z: Int?;
}

struct Outer {
    x: Int;
    y: Inner;
}

contract TestContract {
    s: Outer = Outer{x: 5, y: Inner{z: null}};

    init() {}
}