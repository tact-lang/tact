contract InitOnly {
    counter: Int;
    flag: Bool;

    init() {
        self.counter = 777;
        self.flag = true;
    }
}