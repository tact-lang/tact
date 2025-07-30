// contract storage with empty string defaults
contract EmptyStrings {
    a: String = "";
    b: String = "";
    c: String = "";

    init() {
        self.a = "";
        self.b = "";
        self.c = "";
    }
}