struct MixedOptionals {
    foo: Int?;
    bar: Bool = true;
    baz: Bool?;
    qux: Int = 5;
}

contract MixedOptionalsTest {
    s: MixedOptionals = MixedOptionals{};

    init() {}
}