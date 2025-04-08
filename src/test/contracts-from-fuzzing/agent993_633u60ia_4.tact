struct WithManyFields {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    i6: Int;
    i7: Int;
    i8: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract TestContract {
    storage: WithManyFields;

    init() {
        self.storage = WithManyFields{
            i1:1,i2:2,i3:3,i4:4,i5:5,i6:6,i7:7,i8:8,
            b1:true,b2:false,
            s1:"a",s2:"b",
            o1:null,o2:null,o3:null
        };
    }
}