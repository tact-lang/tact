struct SOpt {
    x: Int?;
    flag: Bool;
}

contract NullableFields {
    ss: SOpt;

    init() {
        self.ss = SOpt{
            x: null,
            flag: true
        };
    }
}