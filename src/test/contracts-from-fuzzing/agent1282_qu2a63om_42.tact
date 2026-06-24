struct SOpt {
    a: Int? = null;
    b: String? = null;
}

contract OptDefaults {
    data: SOpt;

    init() {
        self.data = SOpt{};
    }
}
