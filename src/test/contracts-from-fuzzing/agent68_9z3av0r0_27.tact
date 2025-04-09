contract ZeroLengthStrings {
    a: String;
    b: String = "";

    init() {
        self.a = "";
    }
}