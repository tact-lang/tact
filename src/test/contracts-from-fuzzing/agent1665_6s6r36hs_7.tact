struct Inner {
    foo: Int = 3;
}

struct Mixed {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Inner = Inner{};
}

contract TestContract {
    s: Mixed = Mixed{};

    init() {}
}