struct DefaultsOptional {
    a: Int? = null;
    b: String? = null;
}

contract OptionDef {
    val: DefaultsOptional;

    init() {
        self.val = DefaultsOptional{};
    }
}