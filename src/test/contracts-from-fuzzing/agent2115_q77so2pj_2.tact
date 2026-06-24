struct Inner {
    a: Int = 1;
}

struct Middle {
    inner: Inner = Inner{};
    flag: Bool = true;
}

struct Outer {
    mid: Middle = Middle{};
    name: String = "Hi";
}

contract TestContract {
    o: Outer = Outer{};
    init() {}
}