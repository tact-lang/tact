contract PersistentString {
    s: String;
    sOpt: String?;

    init() {
        self.s = "hi";
        self.sOpt = null;
    }
}