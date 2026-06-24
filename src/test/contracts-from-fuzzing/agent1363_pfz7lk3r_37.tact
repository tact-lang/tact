contract OptionalAddressIntBool {
    ai: Address?;
    bi: Int?;
    ci: Bool?;

    init() {
        self.ai = null;
        self.bi = null;
        self.ci = true;
    }
}