struct BigStruct {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    i6: Int;
    i7: Int;
    i8: Int;
    i9: Int;
    i10: Int;
    s1: String;
    s2: String;
    s3: String;
    b1: Bool;
    b2: Bool;
    b3: Bool;
}

contract BigStructTest {
    store: BigStruct;

    init() {
        self.store = BigStruct{
            i1:1,i2:2,i3:3,i4:4,i5:5,i6:6,i7:7,i8:8,i9:9,i10:10,
            s1:"a",s2:"b",s3:"c",b1:true,b2:false,b3:true
        };
    }
}