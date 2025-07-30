struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
    d: Int?;
    e: Bool?;
}

contract DefaultsTest {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{ d: null, e: false };
    }
}
