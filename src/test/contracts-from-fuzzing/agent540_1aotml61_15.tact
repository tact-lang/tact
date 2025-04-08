contract InitDefaults {
    number: Int = 5;
    flag: Bool = true;
    text: String = "init";

    init() {
        self.number = 42;
        self.flag = false;
        self.text = "changed";
    }
}