struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    field: Inner = Inner{ a: 1, b: true };
}
