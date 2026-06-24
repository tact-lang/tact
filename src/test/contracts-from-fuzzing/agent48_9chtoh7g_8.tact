contract TestContract {
    count: Int as uint4 = 0;
    flag: Bool = true;
    bigNum: Int = 123456789123456789;
    text: String = "hello";

    init() {
        self.count = 15;
        self.flag = false;
        self.bigNum = -987654321;
        self.text = "world";
    }
}
