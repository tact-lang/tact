struct Inner {
    v: Int = 7;
    s: String = "hi";
}

struct Outer {
    inner: Inner = Inner{};
    flag: Bool = true;
}

contract TestContract {
    state: Outer = Outer{};
}