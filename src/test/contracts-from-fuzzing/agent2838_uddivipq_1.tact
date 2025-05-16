struct InnerNested {
    ni1: Int;
    ni2: Bool?;
}

struct Nested {
    n1: Int;
    n2: String?;
    n3: InnerNested;
}

contract ComplexNested {
    s1: Nested;
    
    init() {
        self.s1 = Nested{
            n1: 10,
            n2: null,
            n3: InnerNested{ ni1: 42, ni2: true }
        };
    }
}