struct SOpt {
    foo: Int?;
}

contract DefaultAndOptional {
    s: SOpt = SOpt{ foo: null };

    init() {
        self.s = SOpt{ foo: null };
    }
}