struct OptDefaultsNonNull {
    a: Int? = 7;
    b: Bool? = true;
}

contract StructOptionalDefaults {
    data: OptDefaultsNonNull;

    init() {
        self.data = OptDefaultsNonNull{};
    }
}