struct DefaultsComb {
    a: Int = 1;
    b: Bool = false;
    c: String = "def";
}

contract DefaultsCombo {
    d: DefaultsComb;

    init() {
        self.d = DefaultsComb{};
    }
}