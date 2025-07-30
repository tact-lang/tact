struct Boo {
    x: Int?;

    y: Bool?;
}

contract OptDefaults {
    s: Boo;

    init() {
        self.s = Boo{ x: null, y: null };
    }
}
