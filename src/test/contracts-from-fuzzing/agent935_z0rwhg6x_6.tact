contract TestContract {
    value: Int;
    flag: Bool;
    maybe: Int?;
    text: String;

    init() {
        self.value = 11;
        self.flag = true;
        self.maybe = null;
        self.text = "hello";
    }
}