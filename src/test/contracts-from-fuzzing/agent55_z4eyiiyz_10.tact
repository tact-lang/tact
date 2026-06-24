contract DefaultValues {
    count: Int = 0;
    flag: Bool = false;
    text: String = "";

    init() {
        self.count = 42;
        self.flag = true;
        self.text = "filled";
    }
}
