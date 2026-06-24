contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";

    init() {
        self.a = 99;
        self.b = false;
        self.c = "zzz";
    }
}