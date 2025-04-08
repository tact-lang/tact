struct HasDefaults {
    foo: Int = 123;
    bar: String = "hello";
    baz: Bool = false;
}

contract TestContract {
    val: HasDefaults = HasDefaults{};
    init() {}
}