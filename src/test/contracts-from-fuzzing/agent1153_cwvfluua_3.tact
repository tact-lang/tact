struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract LotsOfOptionals {
    state: ManyOptionals;
    
    init() {
        self.state = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}