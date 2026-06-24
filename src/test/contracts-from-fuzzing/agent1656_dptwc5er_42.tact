contract DefaultsOverride {
    counter: Int = 1;
    flag: Bool = false;
    s: String = "test";

    init() {
        self.counter = 42;
        self.flag = true;
        self.s = "updated";
    }
}
