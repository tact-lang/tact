struct WithManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract OptionalFields {
    data: WithManyOptionals;
    
    init() {
        self.data = WithManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}
