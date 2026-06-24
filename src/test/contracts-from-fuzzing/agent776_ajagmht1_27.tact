struct EmptyStringDefault {
    s: String = "";
}

contract EmptyStringTest {
    data: EmptyStringDefault;
    init() {
        self.data = EmptyStringDefault{};
    }
}