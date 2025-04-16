struct WithDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "abc";
    d: Int?;
    e: Bool?;
}

contract DefaultsContract {
    rec: WithDefaults;

    init() {
        self.rec = WithDefaults{};
    }
}