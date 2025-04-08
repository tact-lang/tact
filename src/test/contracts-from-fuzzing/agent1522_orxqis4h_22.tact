struct Mid {
    x: Int;
    y: Int?;
}

contract OptFields {
    m1: Mid?;
    m2: Mid?;
    m3: Mid?;

    init() {
        self.m1 = null;
        self.m2 = null;
        self.m3 = null;
    }

    receive() {
        let _ = self.m1;
    }
}