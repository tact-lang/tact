struct WithDefaults {
    foo: Int = 7;
    bar: Bool = false;
    baz: Int;
}

contract PartialInitContract {
    s: WithDefaults = WithDefaults{
        baz: 42
    };

    receive() {}
}