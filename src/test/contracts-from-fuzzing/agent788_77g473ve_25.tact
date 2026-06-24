// Struct with many defaults and some unassigned optional
struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = null;
    e: Int = 5;
    f: Bool = false;
}

contract ManyDefaultsTest {
    val: ManyDefaults = ManyDefaults{};
}
