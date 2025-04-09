struct S {
    a: Int = 42;
    b: Bool = true;
}

contract DeepDefaults {
    s: S = S{};
    foo: Int = 5;
}