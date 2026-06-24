contract Types {
    integer: Int;
    flag: Bool;
    text: String;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalText: String?;

    init() {
        self.integer = -10;
        self.flag = true;
        self.text = "sample";
        self.optionalInt = null;
        self.optionalBool = false;
        self.optionalText = null;
    }
}
