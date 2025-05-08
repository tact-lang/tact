contract TestContract {
    num1: Int as int32;
    num2: Int as uint64;
    num3: Int as uint8;
    flag: Bool;
    text: String;

    init() {
        self.num1 = -42;
        self.num2 = 42;
        self.num3 = 255;
        self.flag = false;
        self.text = "serialized";
    }
}