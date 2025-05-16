contract Chains {
    a: Int?;
    b: Int?;
    c: Int?;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
    }

    receive() {
        if (self.a == null) {
            self.a = 0;
        }
    }
}