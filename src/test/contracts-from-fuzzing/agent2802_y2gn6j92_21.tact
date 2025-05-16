contract StringEdge {
    a: String = "";
    b: String = " ";
    c: String = "\\0";
    d: String = "\u{10FFFF}";

    init() {
        self.a = "abc";
        self.b = "\n";
        self.c = "\t";
        self.d = "Ω";
    }
}