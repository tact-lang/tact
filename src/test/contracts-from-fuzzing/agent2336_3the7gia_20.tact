contract DefaultsVsInit {
    a: Int = 5;
    b: Bool;
    c: String = "hi";

    init() {
        self.b = true;
        self.c = "bye";
    }
}