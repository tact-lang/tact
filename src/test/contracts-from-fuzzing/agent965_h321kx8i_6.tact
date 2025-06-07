struct OptNested {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract Demo {
    data: OptNested;
    
    init() {
        self.data = OptNested{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}