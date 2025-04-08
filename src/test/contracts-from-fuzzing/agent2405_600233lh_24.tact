contract DefaultsVsInit {
    a: Int = 10;
    b: Bool;
    c: String = "hey";

    init() {
        self.b = true;
        self.c = "override";
    }
}