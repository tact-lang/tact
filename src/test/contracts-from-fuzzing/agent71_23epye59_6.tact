struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultsTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            d: null,
            e: null,
            f: null
        };
    }
}