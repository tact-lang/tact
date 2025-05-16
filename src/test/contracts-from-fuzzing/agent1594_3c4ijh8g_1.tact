contract TestContract {
    a: Int = 0;
    b: Bool = false;
    c: String = "hello";
    init() {
        self.a = 1;
        self.b = true;
        self.c = "world";
    }
    receive() {}
}