contract DefaultsVsInit {
    a: Int = 1;
    b: Bool = false;
    c: String = "def";

    init() {
        self.a = 42;
        self.b = true;
        self.c = "init";
    }
}