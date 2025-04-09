contract DefaultBoolString {
    flagTrue: Bool = true;
    flagFalse: Bool = false;
    text1: String = "";
    text2: String = "init";

    init() {
        self.flagTrue = false;
        self.flagFalse = true;
        self.text1 = "hello";
        self.text2 = "world";
    }
}