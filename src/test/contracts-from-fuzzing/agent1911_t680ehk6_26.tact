struct OptionalWithDefaults {
    score: Int? = null;
    nickname: String? = null;
    active: Bool = true;
}

contract OptDefTest {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}