struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
    f: Builder?;
    g: Address?;
}

contract OptionalPrimitivesTest {
    data: OptionalPrimitives;
    init() {
        self.data = OptionalPrimitives{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null
        };
    }
}
