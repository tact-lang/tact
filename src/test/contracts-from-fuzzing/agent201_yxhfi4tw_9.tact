struct Inner {
    x: Int = 1;
    y: Int = 2;
}

struct Outer {
    p: Inner = Inner{};
}

contract Test9 {
    outer: Outer = Outer{};
}