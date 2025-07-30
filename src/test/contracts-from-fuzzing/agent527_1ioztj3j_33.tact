contract OnlyFieldsInit {
    i: Int;
    b: Bool;
    s: String;
    init() {
        self.i = 10;
        self.b = true;
        self.s = "yes";
    }
}