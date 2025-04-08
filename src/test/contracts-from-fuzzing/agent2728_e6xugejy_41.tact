contract Test {
    s: String = "start";

    init() {
        self.s = "end";
    }

    get fun s(): String {
        return self.s;
    }
}
