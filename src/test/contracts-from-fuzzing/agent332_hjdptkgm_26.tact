contract StrDefault {
    text: String = "hello";

    init() {
        self.text = "world";
    }
}