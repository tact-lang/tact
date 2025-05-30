struct ManyStr {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract LargeStringStruct {
    bigStrs: ManyStr = ManyStr{
        s1:"1",s2:"2",s3:"3",s4:"4",s5:"5"
    };

    init() {
        self.bigStrs = ManyStr{
            s1:"a", s2:"b", s3:"c", s4:"d", s5:"e"
        };
    }
}
