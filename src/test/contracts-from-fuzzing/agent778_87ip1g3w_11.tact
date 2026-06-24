struct OptionalDeep {
    inner: Int?;
}

contract OptionalFieldDefault {
    data: OptionalDeep;
    init() {
        self.data = OptionalDeep{ inner: null };
    }
}