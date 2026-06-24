struct Inner {
    n: Int = 99;
}

struct Outer {
    field: Inner = Inner{};
}

contract MultiDefault {
    val: Outer = Outer{};
}