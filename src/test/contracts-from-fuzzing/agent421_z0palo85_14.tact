struct OptWithDefaults {
    a: Int? = null;
    b: Int? = null;
    c: Int? = null;
}

contract AllOptionalsDefaults {
    data: OptWithDefaults;
    init() {
        self.data = OptWithDefaults {};
    }
}