struct EmptyOptionalDefaults {
    oi: Int? = null;
    ob: Bool? = null;
    os: String? = null;
    oa: Address? = null;
    oc: Cell? = null;
}

contract OptionalDefaultsDeep {
    payload: EmptyOptionalDefaults;

    init() {
        self.payload = EmptyOptionalDefaults{};
    }
}
