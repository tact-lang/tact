// Optional Address with default
contract OptionalAddress {
    a: Address? = null;
    init() {
        self.a = myAddress();
    }
}