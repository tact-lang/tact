struct InnerS {
    foo: Int; 
}

struct MiddleS {
    inner: InnerS?;
}

struct OuterS {
    middle: MiddleS?;
}

contract MultiOptionalNest {
    data: OuterS;
    init() {
        self.data = OuterS{ middle: MiddleS{ inner: InnerS{ foo: 7 } } };
    }
}