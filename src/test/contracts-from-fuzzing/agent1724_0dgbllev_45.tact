struct Defaulted {
    a: Int = 10;
    b: Bool = true;
}

contract OptDefaults {
    f: Defaulted?;
    init() {
        self.f = null;
    }
}