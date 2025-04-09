contract DefaultInit {
    valInt: Int = 5;
    valBool: Bool = false;
    valStr: String = "abc";
    valOptional: Int? = null;
    valOptBool: Bool? = null;

    init() {
        self.valInt = 6;
        self.valBool = true;
        self.valStr = "def";
        self.valOptional = 7;
        self.valOptBool = false;
    }
}