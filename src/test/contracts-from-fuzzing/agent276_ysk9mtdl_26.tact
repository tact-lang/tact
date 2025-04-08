struct SOpt {
    a: Int?;
    b: Bool?;
}

contract DefaultsInStructs {
    s: SOpt;

    init() {
        self.s = SOpt{
            a: null,
            b: null
        };
    }
}
