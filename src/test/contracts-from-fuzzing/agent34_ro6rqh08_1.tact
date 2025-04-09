contract OnlyBoolIntString {
    flag: Bool;
    counter: Int;
    message: String;

    init() {
        self.flag = true;
        self.counter = 0;
        self.message = "hello";
    }
}
