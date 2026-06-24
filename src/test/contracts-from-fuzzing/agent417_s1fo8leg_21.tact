struct Inner {
    x: Int = 7;
    y: Int = 8;
}

struct Outer {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: String?;
    nested: Inner;
}

contract TestContract {
    outerField: Outer;
    
    init() {
        self.outerField = Outer{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            nested: Inner{} 
        };
    }
}