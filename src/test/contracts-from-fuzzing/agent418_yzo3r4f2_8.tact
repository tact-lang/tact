contract OptionalBasics {
    valInt: Int? = null;
    valBool: Bool? = null;
    valStr: String? = null;

    receive() {
        self.valInt = 999;
        self.valBool = true;
        self.valStr = "hello";
    }
}