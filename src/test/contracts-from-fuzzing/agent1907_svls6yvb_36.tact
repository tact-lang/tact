struct OptionalsDefaultsMix {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "text";
}

contract StructOptionalsDefaultsMix {
    data: OptionalsDefaultsMix;

    init() {
        self.data = OptionalsDefaultsMix{};
    }
}