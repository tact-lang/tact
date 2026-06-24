struct InnerNested {
    v1: Int;
    v2: Bool?;
}

struct OuterNested {
    nested: InnerNested;
    flag: Bool;
}

contract TestNested {
    data: OuterNested;
    
    init() {
        self.data = OuterNested{
            nested: InnerNested{
                v1: 10,
                v2: true,
            },
            flag: false,
        };
    }
}