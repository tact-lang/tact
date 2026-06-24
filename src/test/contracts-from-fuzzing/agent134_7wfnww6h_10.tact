struct InnerDefaults {
    foo: Int? = null;
    bar: Bool? = true;
}

struct Middle {
    nested: InnerDefaults;
}

contract OptionalDefaultsTest {
    m: Middle = Middle{ nested: InnerDefaults{} };
}