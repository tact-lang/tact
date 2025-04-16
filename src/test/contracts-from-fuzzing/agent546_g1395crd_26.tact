struct SimpleStringDefaults {
    a: String = "";
    b: String = "abc";
    c: String = "def";
    d: String;
}

contract DefaultStrs {
    s: SimpleStringDefaults;

    init() {
        self.s = SimpleStringDefaults{ a:"", b:"abc", c:"def", d:"hi" };
    }
}