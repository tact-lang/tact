struct OnlyOptionalDefaults {
    f1: Int? = null;
    f2: Bool? = null;
    f3: Address? = null;
}

contract OptDefaultsTest {
    val: OnlyOptionalDefaults;
    init() {
        self.val = OnlyOptionalDefaults{};
    }
}