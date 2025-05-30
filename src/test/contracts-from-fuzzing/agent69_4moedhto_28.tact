struct DefaultOverrides {
    a: Int = 5;
    b: String = "x";
}

contract DefaultOverridesTest {
    data: DefaultOverrides;
    init() {
        self.data = DefaultOverrides{
            a: 123,
            b: "overridden"
        };
    }
}