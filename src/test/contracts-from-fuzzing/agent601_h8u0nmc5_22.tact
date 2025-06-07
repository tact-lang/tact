// Check large flat struct with mixed types and optionals
struct ManyFields {
    i1: Int;
    o1: Int?;
    s1: String;
    b1: Bool;
    a1: Address;
    i2: Int as uint32;
    o2: Bool?;
    s2: String;
    b2: Bool;
    a2: Address;
}

contract LargeMixed {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            i1:1, o1:null, s1:"A", b1:true, a1:myAddress(),
            i2:2, o2:null, s2:"B", b2:false, a2:myAddress(),
        };
    }
}
