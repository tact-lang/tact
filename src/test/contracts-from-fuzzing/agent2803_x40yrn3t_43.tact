contract OptionalAddressAndString {
    a: Address?;
    s: String?;

    init() {
        self.a=null;
        self.s=null;
    }
}