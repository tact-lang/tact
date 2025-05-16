struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ManyOptionals {
    f: SOpt;

    init() {
        self.f = SOpt{ a: null, b: null, c: null };
    }
}
