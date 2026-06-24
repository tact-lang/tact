struct NonOptionalDefaults {
    a: Int = 4;
    b: Bool = false;
    c: String = "const";
}

contract NonOptDefaultStorage {
    val: NonOptionalDefaults;

    init() {
        self.val = NonOptionalDefaults{};
    }
}
