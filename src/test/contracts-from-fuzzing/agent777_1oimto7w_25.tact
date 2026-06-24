struct LargeNested {
    i1: Int;
    s1: String;
    b1: Bool;
    i2: Int;
    s2: String;
    b2: Bool;
}

contract ManyFieldsContract2 {
    d1: LargeNested;
    d2: LargeNested;

    init() {
        self.d1 = LargeNested{
            i1:1,s1:"a",b1:true,i2:2,s2:"b",b2:false
        };
        self.d2 = LargeNested{
            i1:3,s1:"c",b1:false,i2:4,s2:"d",b2:true
        };
    }
}