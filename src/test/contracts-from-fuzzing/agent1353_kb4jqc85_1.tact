struct InnerNested {
    a: Int;
    b: Bool;
}

struct OuterNested {
    x: Int;
    y: OuterMost?;
}

struct OuterMost {
    in1: InnerNested;
    in2: InnerNested?;
}

contract ComplexNested {
    data: OuterNested;
    
    init() {
        self.data = OuterNested{
            x: 10,
            y: OuterMost{
                in1: InnerNested{ a: 1, b: true },
                in2: null,
            },
        };
    }
}
