contract StructLiteralInit {
    counter: Int;
    flag: Bool;
    txt: String;

    init() {
        self.counter = 0;
        self.flag = false;
        self.txt = "hello";
    }
}
