contract NonDefaultedFields {
    x: Int;
    y: Bool;
    s: String;
    opt1: Int?;
    opt2: String?;

    init() {
        self.x = 5;
        self.y = true;
        self.s = "tex";
        self.opt1 = null;
        self.opt2 = "moo";
    }
}