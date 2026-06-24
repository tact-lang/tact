struct OptionalStruct1 {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract DiverseOptionalFields {
    diverse: OptionalStruct1;

    init() {
        self.diverse = OptionalStruct1{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}