contract DefaultsVsSet {
    count: Int = 10;
    flag: Bool = true;
    word: String = "hi";

    init() {
        self.count = 100;
        self.flag = false;
        self.word = "bye";
    }
}