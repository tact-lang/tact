struct BigStruct {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    s6: String;
    s7: String;
    s8: String;
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
}

contract BigStructVar {
    data: BigStruct = BigStruct{
        s1:"", s2:"", s3:"", s4:"", s5:"", s6:"", s7:"", s8:"",
        i1:0, i2:1, i3:2, i4:3
    };

    init() {
        self.data = BigStruct{
            s1:"a", s2:"b", s3:"c", s4:"d", s5:"e", s6:"f", s7:"g", s8:"h",
            i1:9, i2:8, i3:7, i4:6
        };
    }
}