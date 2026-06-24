struct Nested {
    foo: Int? = 10;
    bar: Bool? = false;
}

contract MixDefaults {
    d: Int = 5;
    s: Nested = Nested{};
}