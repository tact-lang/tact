message(999) FooMsg {
    a: Int;
}

contract TestContract {
    foo: FooMsg = FooMsg{ a: 1 };
    init() {}
}