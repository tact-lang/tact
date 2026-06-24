contract StrBool {
    a: String = "start";
    b: Bool = true;

    init() {
        self.b = false;
        self.a = "end";
    }
}