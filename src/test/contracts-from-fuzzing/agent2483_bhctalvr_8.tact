struct Inner {
    flag: Bool = false;
    val: Int = 42;
}

struct Outer {
    inner: Inner;
    count: Int = 7;
}

contract TestContract {
    nestedField: Outer = Outer{ count: 100, inner: Inner{ flag: true } };
    init() {}
}