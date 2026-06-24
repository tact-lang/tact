struct Strange {
    i: Int?;
    s: String = "default";
    b: Bool?;
}

contract Test {
    odd: Strange;
    init() {
        self.odd = Strange{ i: null, b: null };
    }
}