struct ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int? = null;
    e: String? = null;
}

contract ZeroDefContract {
    store: ZeroDefaults;

    init() {
        self.store = ZeroDefaults{};
    }
}