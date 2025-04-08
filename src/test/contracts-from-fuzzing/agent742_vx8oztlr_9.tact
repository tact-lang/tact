contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address?;

    init() {
        self.a = 7;
        self.b = false;
        self.c = "abc";
        self.d = null;
    }
}