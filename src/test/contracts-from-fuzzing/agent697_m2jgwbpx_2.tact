contract TestContract {
    a: Int = 1;
    b: Bool = false;
    d: String = "test";

    init() {
        self.a = 1;
        self.b = true;
        self.d = "hello";
    }

    receive() {}
}