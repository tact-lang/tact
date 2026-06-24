struct SeveralOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract ManyOptionals {
    so: SeveralOptionals;
    
    init() {
        self.so = SeveralOptionals{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}