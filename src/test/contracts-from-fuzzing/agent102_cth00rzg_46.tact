contract DefaultedStrings {
    a: String = "X";
    b: String? = null;

    init() {
        self.a = "Y";
        self.b = null;
    }
}