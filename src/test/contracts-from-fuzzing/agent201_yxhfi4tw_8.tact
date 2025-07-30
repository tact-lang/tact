struct Inner {
    x: Int = 1;
    y: Int = 2;
}

struct Outer {
    p: Inner;
}

contract Test8 {
    outer: Outer = Outer{p: Inner{}};
}