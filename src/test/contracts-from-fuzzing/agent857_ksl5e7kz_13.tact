struct HasDefaults {
    foo: Int = 1;
    bar: Bool = true;
    baz: String = "abc";
}

contract TestContract {
    d: HasDefaults = HasDefaults{};
}