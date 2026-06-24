struct ParamDefaults {
    n: Int = 1;
    label: String = "default";
    optFlag: Bool?; // implicitly null
}

contract DefaultsInsideStorage {
    params: ParamDefaults;
    init() {
        self.params = ParamDefaults{};
    }
}