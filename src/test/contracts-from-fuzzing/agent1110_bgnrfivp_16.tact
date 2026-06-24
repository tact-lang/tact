contract RoundTripSerialize {
    fieldInt: Int as int128;
    fieldBool: Bool;
    fieldStr: String;
    optStr: String?;

    init() {
        self.fieldInt = 123456789;
        self.fieldBool = true;
        self.fieldStr = "serialization";
        self.optStr = null;
    }
}