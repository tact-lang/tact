struct SOpt {
    v1: Int?;
    v2: String?;
    v3: Bool?;
}

contract ContractSOpt {
    s: SOpt;

    init() {
        self.s = SOpt{ v1: null, v2: "xxx", v3: null };
    }
}