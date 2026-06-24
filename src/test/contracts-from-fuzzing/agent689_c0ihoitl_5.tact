contract OptionalInPersistentTest {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeStr: String?;

    init() {
        self.maybeInt = null;
        self.maybeBool = true;
        self.maybeStr = null;
    }
}