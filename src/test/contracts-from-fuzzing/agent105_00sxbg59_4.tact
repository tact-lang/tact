contract DefaultsAndOptionals {
    a: Int = 1;
    b: Int?; // optional, default null
    c: Bool = true;
    d: Bool?; // optional, default null

    init() {
        self.b = null;
        self.d = false;
    }
}