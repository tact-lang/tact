struct Inner {
    flag: Bool;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    outer: Outer = Outer{};
}