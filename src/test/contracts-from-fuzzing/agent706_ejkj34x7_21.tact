contract SerializeAs {
    small: Int as uint8;
    large: Int as int257;
    text: String;
    flag: Bool;

    init() {
        self.small = 255;
        self.large = -1;
        self.text = "hello";
        self.flag = false;
    }
}