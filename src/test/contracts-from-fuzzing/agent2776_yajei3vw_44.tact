struct Basic {
    i: Int;
    b: Bool;
}

contract DefField {
    f: Basic = Basic{ i: 0, b: false };
    init() {
        self.f = Basic{ i: 1, b: true };
    }
}
