struct OptionalPrimitivesDefaults {
    oi: Int? = null;
    ob: Bool? = null;
    oa: Address? = null;
    os: String? = null;
}

contract DefaultsAllOptional {
    data: OptionalPrimitivesDefaults;

    init() {
        self.data = OptionalPrimitivesDefaults{};
    }
}