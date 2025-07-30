struct LargeStructWithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Bool = false;
    e: Int = 5;
    f: Bool = false;
    g: Int? = null;
    h: Bool = true;
}

contract LargeStructDefaultsTest {
    s: LargeStructWithDefaults = LargeStructWithDefaults{};
}
