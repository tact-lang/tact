struct Middle {
    inner: Int = 42;
}

struct Outer {
    mid: Middle = Middle{};
}

contract DefaultsEverywhere {
    f: Outer = Outer{};
}