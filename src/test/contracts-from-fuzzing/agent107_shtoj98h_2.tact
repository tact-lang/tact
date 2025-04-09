struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract TestContract {
    data: ManyOptionals;
    
    init() {
        self.data = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}
