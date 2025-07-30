struct InnerMost {
    b: Bool;
    v: String;
}

struct Inner {
    a: Int;
    im: InnerMost;
}

struct OuterOpt {
    inn: Inner?;
    other: Bool;
}

contract OptionalDeepNode {
    nested: OuterOpt;
    
    init() {
        self.nested = OuterOpt{
            inn: null,
            other: true
        };
    }
}