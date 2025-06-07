contract StringEdgeDefault {
    s1: String = "";
    s2: String = "abc";

    init() {
        self.s1 = "x";
        self.s2 = "def";
    }
}