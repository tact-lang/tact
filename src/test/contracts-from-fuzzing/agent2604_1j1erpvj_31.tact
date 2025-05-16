struct OptDefault {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract OptStructDefault {
    val: OptDefault;

    init() {
        self.val = OptDefault{};
    }
}