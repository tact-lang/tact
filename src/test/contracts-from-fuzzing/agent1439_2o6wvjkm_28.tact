struct A {
    foo: Int = 1;
    bar: Bool = true;
}

struct B {
    baz: String = "ok";
    inner: A = A{};
}

contract NestedDefaults {
    n: B;

    init() {
        self.n = B{};
    }
}