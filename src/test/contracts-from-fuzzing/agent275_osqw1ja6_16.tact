contract TestContract {
    val: Int as int128 = 0;
    flag: Bool = false;
    text: String = "hi";

    init() {
        self.val = 123456789;
        self.flag = true;
        self.text = "changed";
    }
}