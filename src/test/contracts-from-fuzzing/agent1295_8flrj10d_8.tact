contract TestContract {
    a: Int = 1;
    b: Bool;
    c: String = "abc";

    init() {
        self.b = false;
        self.c = "xyz";
    }
}