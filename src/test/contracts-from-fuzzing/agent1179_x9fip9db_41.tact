contract InitDefaults {
    number: Int = 42;
    flag: Bool = true;
    text: String = "hello";

    init() {
        self.number = 7;
        self.flag = false;
        self.text = "bye";
    }

    receive() {}
}