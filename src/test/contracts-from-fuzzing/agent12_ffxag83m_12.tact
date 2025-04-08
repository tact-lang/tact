struct Big {
    i1: Int;  i2: Int;  i3: Int;  i4: Int;  i5: Int;
    s1: String;  s2: String;  s3: String;
    b1: Bool;  b2: Bool;  b3: Bool;
    o1: Int?;  o2: String?;  o3: Bool?;
}

contract LargeStruct {
    st: Big;

    init() {
        self.st = Big{
            i1:1,i2:2,i3:3,i4:4,i5:5,
            s1:"A",s2:"B",s3:"C",
            b1:true,b2:false,b3:true,
            o1:null,o2:null,o3:null
        };
    }
}
