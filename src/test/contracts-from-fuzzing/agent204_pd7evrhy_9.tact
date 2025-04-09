contract StringBoolInt {
    greeting: String;
    flag: Bool;
    num: Int;

    init() {
        self.greeting = "hi";
        self.flag = true;
        self.num = 123;
    }

    receive() {
        self.flag = !self.flag;
        self.num += 1;
    }
}