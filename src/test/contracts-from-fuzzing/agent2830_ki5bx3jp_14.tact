struct Middle {
    innerInt: Int?;
    flag: Bool;
    text: String;
}

contract ManyStructs {
    s1: Middle;
    s2: Middle;
    s3: Middle;
    s4: Middle;

    init() {
        self.s1 = Middle{innerInt:null, flag:true, text:"a"};
        self.s2 = Middle{innerInt:2, flag:false, text:"b"};
        self.s3 = Middle{innerInt:null, flag:true, text:"c"};
        self.s4 = Middle{innerInt:4, flag:false, text:"d"};
    }
}