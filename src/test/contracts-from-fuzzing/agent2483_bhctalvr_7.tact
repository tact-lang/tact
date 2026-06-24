struct Inner {
    val: Int = 5;
}

struct Outer {
    optionalInner: Inner?;
}

contract TestContract {
    nestedOptField: Outer = Outer{ optionalInner: null };
    init() {}
}