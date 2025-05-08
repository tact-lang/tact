struct ManyOptionals {
    s: String?;
    a: Address?;
    b: Bool?;
    s2: String?;
    a2: Address?;
    b2: Bool?;
}

contract LotsOfOptionalFields {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            s: null,
            a: null,
            b: null,
            s2: null,
            a2: null,
            b2: null
        };
    }
}