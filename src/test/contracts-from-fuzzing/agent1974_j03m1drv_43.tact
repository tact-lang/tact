struct Weird {
    a: Int?;
    b: Int;
    c: Bool;
    d: Int?;
}

contract OptionalSpread {
    v: Weird;
    
    init() {
        self.v = Weird{
            a: null,
            b: 5,
            c: true,
            d: null
        };
    }
}
