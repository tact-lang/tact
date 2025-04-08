struct EmptyStringDefault {
    s: String = "";
}

contract EmptyString {
    val: EmptyStringDefault;

    init() {
        self.val = EmptyStringDefault{};
    }
}
