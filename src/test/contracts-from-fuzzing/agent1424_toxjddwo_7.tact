struct DefaultValues {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";
    d: Int?;
}

contract DefaultsTest {
    value: DefaultValues;

    init() {
        self.value = DefaultValues{
            d: null
        };
    }
}