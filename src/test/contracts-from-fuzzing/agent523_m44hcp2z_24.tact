struct OptDefaults {
    x: Int? = 1;
    y: Bool? = true;
    txt: String? = "abc";
}

contract OptDefaultTest {
    val: OptDefaults;

    init() {
        self.val = OptDefaults{};
    }
}
