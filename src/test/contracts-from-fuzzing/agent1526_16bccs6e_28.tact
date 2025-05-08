struct NullablePrimitives {
    i: Int?;
    b: Bool?;
    a: Address?;
    s: String?;
}

contract NullPrimTest {
    f: NullablePrimitives;

    init() {
        self.f = NullablePrimitives{
            i:null,b:null,a:null,s:null
        };
    }
}