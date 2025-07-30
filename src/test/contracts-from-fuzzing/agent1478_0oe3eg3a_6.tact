struct WithDefaults {
    val1: Int = 1;
    val2: Int = 2;
    val3: Int = 3;
    flag: Bool = false;
    opt: Int?;
}

contract DefaultsTest {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{ val1: 10, val2: 20, val3: 30, flag: true };
    }
}
