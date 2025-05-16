struct OptionalsDefault {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestOptionalsDefault {
    data: OptionalsDefault;

    init() {
        self.data = OptionalsDefault{};
    }
}
