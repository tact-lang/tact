struct PartialDefaults {
    x: Int = 1;
    y: Bool;
}

contract PartialDefaultsTest {
    s: PartialDefaults = PartialDefaults{
        y: false
    };
}