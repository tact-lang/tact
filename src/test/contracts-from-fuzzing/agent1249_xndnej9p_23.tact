struct MultiDefaults {
    x: Int = 7;
    y: Bool = true;
    s: String = "abc";
    a: Address?;
}

contract DefaultsTest {
    field: MultiDefaults;

    init() {
        self.field = MultiDefaults{
            a: null
        };
    }
}