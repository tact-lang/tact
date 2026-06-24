struct SOpt {
    x: Int?;
}

contract DefaultNullOptional {
    f: SOpt;

    init() {
        self.f = SOpt{ x: null };
    }
}