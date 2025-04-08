struct A {
    s: String = "hello";
    b: Bool = true;
}

struct B {
    i: Int = 42;
    inner: A = A{};
}

contract Test {
    data: B = B{};
    init() {}
}
