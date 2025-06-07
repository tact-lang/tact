struct Inner {
    a: Int;
    b: Bool;
}

contract Test {
    testField: Inner = Inner{a: 1, b: true};
}