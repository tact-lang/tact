contract OptionalAddressString {
    maybeAddr: Address?;
    maybeStr: String?;

    init() {
        self.maybeAddr = null;
        self.maybeStr = null;
    }
}