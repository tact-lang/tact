contract DefaultsAndExplicit {
    a: Int = 42;
    b: Bool;
    c: String = "default";

    init() {
        self.b = true;
    }
}