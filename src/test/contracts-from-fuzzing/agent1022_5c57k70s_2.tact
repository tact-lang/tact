contract TestContract {
    a: Int = 7;
    b: Bool = true;
    c: String = "hello";

    init() {
        self.a = 42;
        self.b = false;
        self.c = "world";
    }

    receive() {}
}