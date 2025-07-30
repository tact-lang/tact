struct BigStruct {
    s1: String;
    i1: Int;
    b1: Bool;
    s2: String;
    i2: Int;
    b2: Bool;
    s3: String;
    i3: Int;
    b3: Bool;
    s4: String;
    i4: Int;
    b4: Bool;
    s5: String;
    i5: Int;
    b5: Bool;
    s6: String;
    i6: Int;
    b6: Bool;
    s7: String;
    i7: Int;
    b7: Bool;
}

contract BigStructsContract {
    d: BigStruct;

    init() {
        self.d = BigStruct{
            s1: "a", i1:1, b1:true,
            s2: "b", i2:2, b2:false,
            s3: "c", i3:3, b3:true,
            s4: "d", i4:4, b4:false,
            s5: "e", i5:5, b5:true,
            s6: "f", i6:6, b6:false,
            s7: "g", i7:7, b7:true
        };
    }
}