contract TestContract {
    number: Int = 1;
    flag: Bool = true;
    text: String = "hi";
    numberOptional: Int? = null;
    flagOptional: Bool? = false;
    textOptional: String? = null;

    init() {
        self.number = 42;
        self.flag = false;
        self.text = "changed";
        self.numberOptional = 100;
        self.flagOptional = true;
        self.textOptional = "hello";
    }
}