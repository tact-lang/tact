struct Sub {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract SubOptional {
    f: Sub?;

    init() {
        self.f = null;
    }
}
