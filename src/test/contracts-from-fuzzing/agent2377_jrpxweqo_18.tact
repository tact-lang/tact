contract OptionalStringVsEmptyString {
    optStr: String?;
    str: String;

    init() {
        self.optStr = null;
        self.str = "";
    }
}