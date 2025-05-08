struct OptionDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

contract OptionDefaultContract {
    opt: OptionDefaults;

    init() {
        self.opt = OptionDefaults{};
    }
}