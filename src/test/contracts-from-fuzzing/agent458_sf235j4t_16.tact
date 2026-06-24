struct SOpt {
    optA: Int?;
    optB: Bool?;
    optC: String?;
    optD: Address?;
}

contract AllOptionals {
    sopt: SOpt;

    init() {
        self.sopt = SOpt{
            optA: null,
            optB: null,
            optC: null,
            optD: null
        };
    }
}