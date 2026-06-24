struct ManyFields {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
}

contract HugeStructTest {
    mf: ManyFields;

    init() {
        self.mf = ManyFields{
            i1:1,i2:2,i3:3,i4:4,i5:5,b1:true,b2:false,s1:"a",s2:"b"
        };
    }
}