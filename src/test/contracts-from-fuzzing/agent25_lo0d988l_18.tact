struct HasEmptyStringDefault {
    text: String = "";
}

contract TestContract {
    val: HasEmptyStringDefault;

    init() {
        self.val = HasEmptyStringDefault{};
    }
}