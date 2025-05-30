struct DefaultOptCombo {
    s: String? = null;
    n: Int = 42;
}

contract DefaultOptStruct {
    f: DefaultOptCombo;

    init() {
        self.f = DefaultOptCombo{};
    }
}