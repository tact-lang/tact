struct LargeStructOptionalPrimitives {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Address?;
    f: Int?;
    g: Int?;
    h: Int?;
}

contract TestLargeStructOptPrimitives {
    s: LargeStructOptionalPrimitives;

    init() {
        self.s = LargeStructOptionalPrimitives{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}
