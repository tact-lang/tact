struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    optFields: ManyOptionals;
    
    init() {
        self.optFields = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}