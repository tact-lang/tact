struct ManyFields {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    s1: String;
    s2: String;
    s3: String;
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract ManyFieldsContract {
    state: ManyFields;

    init() {
        self.state = ManyFields{
            i1:1,i2:2,i3:3,i4:4,i5:5,
            b1:true,b2:false,b3:true,b4:false,
            s1:"a",s2:"b",s3:"c",
            o1:null,o2:null,o3:null
        };
    }
}