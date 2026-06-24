struct ExplicitDefaults {
    a: Int = 1;
    b: String = "hi";
    c: Int? = null;
    d: Bool? = null;
}

contract ExplicitDefaultsTest {
    v: ExplicitDefaults = ExplicitDefaults{};
}