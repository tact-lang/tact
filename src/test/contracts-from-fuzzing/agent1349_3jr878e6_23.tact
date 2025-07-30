contract WeirdDefaults {
    v1: Int = 42;
    v2: Bool;
    v3: Int;

    init() {
        self.v2 = false;
        self.v3 = 100;
    }

    receive() {
        self.v1 = self.v1;
    }
}