struct Deep {
    foo: Int? = null;
    bar: Int? = 5;
    flag: Bool = true;
}

struct Mid {
    d: Deep = Deep{};
    answer: Int = 42;
}

struct Outer {
    mid: Mid = Mid{};
    name: String = "test";
}

contract TestContract {
    nested: Outer = Outer{};
    init() {}
}