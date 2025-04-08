struct Inner {
    a: Int = 1;
    b: String? = null;
}

struct Mid {
    inner: Inner = Inner{};
    note: String = "mid";
}

struct Outer {
    mid: Mid = Mid{};
    flag: Bool = true;
}

contract TestContract {
    complex: Outer;

    init() {
        self.complex = Outer{};
    }
}