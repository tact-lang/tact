contract MixPersistence {
    intfield: Int = 42;
    boolfield: Bool;
    stringfield: String = "hello";
    ofield: Int?;

    init() {
        self.boolfield = true;
        self.ofield = null;
    }
}