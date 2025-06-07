struct AllDefaults {
    foo: Int = 1;
    bar: Bool = false;
    baz: String = "hi";
    extra: Int? = null;
}

contract TestContract {
    data: AllDefaults = AllDefaults{};

    receive() {}
}