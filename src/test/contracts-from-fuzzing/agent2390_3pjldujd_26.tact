struct WithDefaults {
    a: Int = 7;
    b: Int?;
    c: Bool = true;
}

contract DefaultsTest {
    v: WithDefaults;
    init() {
        self.v = WithDefaults{ b: null };
    }
}