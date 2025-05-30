contract OptionalInStorage {
    someInt: Int?;
    someBool: Bool?;

    init() {
        self.someInt = null;
        self.someBool = true;
    }
}