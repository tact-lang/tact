struct HasString {
    txt: String;
    txt2: String = "default";
}

contract StringStructContract {
    s: HasString;
    init() {
        self.s = HasString{txt:"x"};
    }
}