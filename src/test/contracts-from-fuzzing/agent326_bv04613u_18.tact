struct EmptyStringDefault {
    s: String = "";
}

contract EmptyStrDefTest {
    val: EmptyStringDefault;

    init() {
        self.val = EmptyStringDefault{};
    }
}
