struct OptionalDeep {
    nested: String?;
    n2: Int?;
}

contract OptionalDeepContract {
    deep: OptionalDeep;

    init() {
        self.deep = OptionalDeep{ nested: null, n2: null };
    }
}