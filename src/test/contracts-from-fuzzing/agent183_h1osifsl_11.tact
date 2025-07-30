struct Complex {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Int;
    f: Int?;
    g: Bool;
    h: Bool?;
}

contract TestContract {
    field: Complex?;
    
    init() {
        self.field = Complex{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: 5,
            f: 6,
            g: false,
            h: true
        };
    }
}