struct Wide {
    i1: Int = 1;
    i2: Int = 2;
    i3: Int = 3;
    i4: Int = 4;
    i5: Int = 5;
    i6: Int = 6;
    i7: Int = 7;
    i8: Int = 8;
    s1: String = "s1";
    s2: String = "s2";
    s3: String = "s3";
    s4: String = "s4";
    s5: String = "s5";
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;
}

contract WideFieldsHolder {
    big: Wide;

    init() {
        self.big = Wide{
            i1:11,i2:12,i3:13,i4:14,i5:15,i6:16,i7:17,i8:18,
            s1:"one",s2:"two",s3:"three",s4:"four",s5:"five",
            b1:false,b2:true,b3:false,b4:true
        };
    }
}