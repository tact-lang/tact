contract DefaultsInContract {
    a: Int = 10;
    b: Int = -1;
    c: Bool = true;
    s: String = "hello";

    init() {
        self.a = 20;
        self.b = 5;
        self.c = false;
        self.s = "world";
    }
}