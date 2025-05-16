contract TestContract {
    flag: Bool;
    count: Int;
    message: String;

    init() {
        self.flag = true;
        self.count = 42;
        self.message = "hello world";
    }
}
