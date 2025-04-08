struct ComplexOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
    g: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
}

contract ComplexOptionalTest {
    data: ComplexOptional;

    init() {
        self.data = ComplexOptional{
            a:null,b:null,c:null,d:null,e:null,f:null,g:InnerOpt{x:null}
        };
    }
}