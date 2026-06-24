struct Inner {
    x: Int = 1;
    y: Bool = false;
}

struct Mid {
    val: Int = 7;
    nested: Inner = Inner{};
}

struct Outer {
    name: String = "x";
    mid: Mid = Mid{};
    flag: Bool = true;
    optInt: Int? = null;
}

contract NestedExplicitDefault {
    big: Outer = Outer{};
}