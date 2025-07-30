struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "foo";
    d: Int? = null;
    e: Bool? = null;
}

contract DefaultsTest {
    wd: WithDefaults;

    init() {
        self.wd = WithDefaults{};
    }

    receive() {
        let _ = self.wd.c;
    }
}