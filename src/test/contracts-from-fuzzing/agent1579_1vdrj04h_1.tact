struct InnerMost {
    a: Int;
    b: Int?;
}

struct Nested {
    im: InnerMost;
    c: Bool;
    d: Bool?;
}

contract DeepNestedStorage {
    data: Nested;
    
    init() {
        self.data = Nested{
            im: InnerMost{
                a: 1,
                b: null,
            },
            c: true,
            d: null,
        };
    }
}