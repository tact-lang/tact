contract DefaultsAndOverrides {
    a: Int = 1;
    b: Int;
    c: Bool = true;
    d: Bool;
    s: String = "hi";
    t: String;

    init() {
        self.b = 2;
        self.d = false;
        self.t = "bye";
    }
}