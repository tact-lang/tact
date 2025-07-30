struct SOpt {
    optionalValue: Int?;
}

contract OptionalDefaultNull {
    s: SOpt = SOpt{optionalValue:null};

    init() {
        self.s = SOpt{optionalValue: 42};
    }
}