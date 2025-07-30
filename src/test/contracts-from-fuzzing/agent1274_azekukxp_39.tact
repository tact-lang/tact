contract PersistentOptionalIntString {
    anInt: Int?;
    aStr: String?;

    init() {
        self.anInt = null;
        self.aStr = null;
    }
}