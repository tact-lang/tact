struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

struct OuterOpt {
    nested: InnerOpt?;
}

contract ComplexOpt {
    optField: OuterOpt;
    
    init() {
        self.optField = OuterOpt{
            nested: InnerOpt{ foo: null, bar: null }
        };
    }
}
