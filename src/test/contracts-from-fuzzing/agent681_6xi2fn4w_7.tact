contract LargeStrings {
    a: String;
    b: String;
    c: String;

    init() {
        self.a = "Some longer string data A";
        self.b = "Even longer string data B \n with newline";
        self.c = "Special chars: \n \t \\";
    }
}
