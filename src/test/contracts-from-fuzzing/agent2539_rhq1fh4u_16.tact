struct Many {
 f0: Int;
 f1: Int;
 f2: Int;
 f3: Int;
 f4: Bool;
 f5: String;
 f6: Int;
 f7: Bool;
 f8: String;
}

contract ManyStructs {
    s1: Many;
    s2: Many;
    s3: Many;

    init() {
        self.s1 = Many{f0:0,f1:1,f2:2,f3:3,f4:true,f5:"1",f6:6,f7:false,f8:"a"};
        self.s2 = Many{f0:10,f1:11,f2:12,f3:13,f4:false,f5:"2",f6:16,f7:true,f8:"b"};
        self.s3 = Many{f0:20,f1:21,f2:22,f3:23,f4:true,f5:"3",f6:26,f7:true,f8:"c"};
    }
}
