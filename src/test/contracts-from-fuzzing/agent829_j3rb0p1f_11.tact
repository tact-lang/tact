contract DefaultsAndInit {
    val: Int = 10;
    flag: Bool = true;
    text: String = "hi";

    init() {
        self.val = 42;
        self.flag = false;
        self.text = "bye";
    }
}