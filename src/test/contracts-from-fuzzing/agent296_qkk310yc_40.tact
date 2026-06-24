contract SlotReuse {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";

    init() {
        self.a = 42;
        self.b = false;
        self.c = "changed";
    }
}