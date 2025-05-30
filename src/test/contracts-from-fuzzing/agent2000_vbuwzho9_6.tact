struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptFields {
    myfield: WithOptionals;

    init() {
        self.myfield = WithOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}