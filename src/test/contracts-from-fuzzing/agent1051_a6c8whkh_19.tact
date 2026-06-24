contract TestContract {
    one: Bool?;
    two: String?;
    three: Address;
    init() {
        self.one = null;
        self.two = null;
        self.three = myAddress();
    }
}