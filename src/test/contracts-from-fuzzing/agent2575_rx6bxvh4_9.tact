struct WithDefaults {
    foo: Int = 10;
    bar: Bool = true;
    baz: Int?; // defaults to null
}

contract TestContract {
    wd: WithDefaults = WithDefaults{};
}