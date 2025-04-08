struct Nested {
    x: Int = 1;
    y: String = "y";
}

struct Combo {
    b: Bool = true;
    s: String = "s";
    i: Int = 123;
    n: Nested = Nested{};
}

contract TestContract {
    c: Combo = Combo{};
}