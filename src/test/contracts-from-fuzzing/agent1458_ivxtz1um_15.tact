struct StructDefaults {
    score: Int = 7;
    flag: Bool = false;
    name: String = "anon";
}

contract ContractDefaults {
    profile: StructDefaults;

    init() {
        self.profile = StructDefaults{};
    }
}