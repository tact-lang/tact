contract NullableAddressesStrings {
    a: Address?;
    b: String?;

    init() {
        self.a = null;
        self.b = null;
    }
}
