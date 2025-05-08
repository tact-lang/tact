contract DefaultedFields {
    count: Int = 42;
    flag: Bool = true;
    text: String = "hello";

    init() {
        self.count = 100;
        self.flag = false;
        self.text = "world";
    }
}