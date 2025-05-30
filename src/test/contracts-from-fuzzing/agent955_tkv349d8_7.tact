struct DefaultsAndOptional {
    a: Int = 10;
    b: Bool?;
    c: String = "hello";
    d: String?;
}

contract MixedDefaultsTest {
    data: DefaultsAndOptional;

    init() {
        self.data = DefaultsAndOptional{
            b: null,
            d: null,
        };
    }
}