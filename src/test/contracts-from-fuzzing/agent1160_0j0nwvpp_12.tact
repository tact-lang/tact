struct ComplexOptions {
    optA: Int?;
    optB: Bool?;
    optC: String?;
    optD: Address?;
    optE: Cell?;
}

contract ComplexOptionals {
    data: ComplexOptions;

    init() {
        self.data = ComplexOptions{
            optA: null,
            optB: null,
            optC: null,
            optD: null,
            optE: null
        };
    }
}