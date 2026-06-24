struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptStruct {
    values: ManyOptionals;

    init() {
        self.values = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}