struct DefaultsMix {
    a: Int = 7;
    b: Bool; 
    c: String = "foo";
    d: Int?;
    e: Bool? = false;
    f: String?;
}

contract DefaultsTest {
    data: DefaultsMix;

    init() {
        self.data = DefaultsMix{
            b: true,
            d: null,
            f: "bar"
        };
    }
}
