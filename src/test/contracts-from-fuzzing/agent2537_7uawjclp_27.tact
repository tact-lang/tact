struct StrDefault {
    text: String = "default";
}

contract StrDefaultsStore {
    val: StrDefault;
    init() {
        self.val = StrDefault{};
    }
}