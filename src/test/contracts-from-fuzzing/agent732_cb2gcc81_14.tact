struct InnerOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct OuterOpt {
    inner: InnerOpt?;
    d: Int;
    e: String;
}

contract ComplexOptionals {
    data: OuterOpt;
    
    init() {
        self.data = OuterOpt{
            inner: InnerOpt{
                a: null,
                b: true,
                c: null
            },
            d: 5,
            e: "hi"
        };
    }
}