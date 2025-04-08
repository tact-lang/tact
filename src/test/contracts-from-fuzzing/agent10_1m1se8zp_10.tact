struct WithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "str";
    d: Int?; // defaults to null implicitly
    e: Bool?; // defaults to null implicitly
}

contract DefaultsTest {
    data: WithDefaults;
    init() {
        self.data = WithDefaults{
            a: 1,
            b: true,
            c: "changed",
            d: null,
            e: null,
        };
    }
}
