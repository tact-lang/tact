contract OptionalFields {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
    maybeAddr: Address?;

    init() {
        self.maybeInt = 123;
        self.maybeBool = true;
        self.maybeString = "optional";
        self.maybeAddr = myAddress();
    }
}