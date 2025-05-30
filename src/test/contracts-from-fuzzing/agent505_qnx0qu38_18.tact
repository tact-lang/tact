contract DefaultVals {
    a: Int = 10;
    b: Bool = true;
    c: String = "test";

    init() {
        self.a = 20;
        self.b = false;
        self.c = "updated";
    }

    receive() {
        self.a = self.a + 1;
    }
}