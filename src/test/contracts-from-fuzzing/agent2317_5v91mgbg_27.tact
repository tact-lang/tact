contract DefaultsVsInit {
    a: Int = 5;
    b: String = "default";
    c: Bool = true;

    init() {
        self.a = 10;
        self.b = "changed";
        self.c = false;
    }
}