struct MixedDefaults {
    a: Int;
    b: Bool = true;
    c: String;
}

contract MixedDefaultsTest {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            a: 42,
            c: "hello"
        };
    }
}