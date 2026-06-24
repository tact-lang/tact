struct Inner {
    v: Int = 7;
}

struct Outer {
    x: Inner?;
    y: Inner?;
}

contract TestContract {
    s: Outer = Outer{
        x: Inner{},
        y: Inner{},
    };

    init() {}
}