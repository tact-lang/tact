struct ManyNestedPrimitiveOptionals {
    i1: Int?;
    i2: Int?;
    b1: Bool?;
    b2: Bool?;
    s1: String?;
    s2: String?;
    a1: Address?;
    a2: Address?;
}

contract NestedOptionalFields {
    f: ManyNestedPrimitiveOptionals;

    init() {
        self.f = ManyNestedPrimitiveOptionals{
            i1:null,i2:null,b1:null,b2:null,
            s1:null,s2:null,a1:null,a2:null
        };
    }
}