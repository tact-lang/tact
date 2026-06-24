struct OptionalsAndDefaults {
    a: Int? = null;
    b: Bool? = false;
    c: Address? = null;
    d: String? = "default";
    e: Int = 5;
    f: Bool = true;
}

contract DefaultsOptional {
    val: OptionalsAndDefaults;
    
    init() {
        self.val = OptionalsAndDefaults{};
    }
}