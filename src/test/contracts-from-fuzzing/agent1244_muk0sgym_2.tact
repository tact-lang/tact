struct ManyPrimitives {
    i1: Int;
    b1: Bool;
    s1: String;
    i2: Int;
    b2: Bool;
    s2: String;
    i3: Int;
    b3: Bool;
    s3: String;
    i4: Int;
    b4: Bool;
    s4: String;
    i5: Int;
    b5: Bool;
    s5: String;
    i6: Int;
    b6: Bool;
    s6: String;
    i7: Int;
    b7: Bool;
    s7: String;
}

contract LargeStructStorage {
    big: ManyPrimitives;

    init() {
        self.big = ManyPrimitives{
            i1:1, b1:true, s1:"a",
            i2:2, b2:false, s2:"b",
            i3:3, b3:true, s3:"c",
            i4:4, b4:false, s4:"d",
            i5:5, b5:true, s5:"e",
            i6:6, b6:false, s6:"f",
            i7:7, b7:true, s7:"g",
        };
    }
}
