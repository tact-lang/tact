struct DefaultsPlusOption {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract Test {
    value: DefaultsPlusOption;

    init() {
        self.value = DefaultsPlusOption{};
    }
}