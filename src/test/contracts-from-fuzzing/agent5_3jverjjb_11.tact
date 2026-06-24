struct DefaultsTest {
    v1: Int = 0;
    v2: Bool = false;
    v3: String = "";
    v4: Int?;  // implicit default null
    v5: String?; // implicit default null
}

contract Defaults {
    s: DefaultsTest;

    init() {
        self.s = DefaultsTest{};
    }

    receive() {
        let _ = self.s;
    }
}