contract DefaultsAndExplicit {
    a: Int = 1;
    b: Int;
    c: Bool = true;
    d: Bool;

    init() {
        self.b = 2;
        self.d = false;
    }
}