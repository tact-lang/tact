struct DefaultsMix {
    a: Int = -1;
    b: Int? = null;
    c: Bool = false;
    d: String = "OK";
    e: String? = null;
}

contract MixedDefaults {
    data: DefaultsMix;

    init() {
        self.data = DefaultsMix{};
    }
}
