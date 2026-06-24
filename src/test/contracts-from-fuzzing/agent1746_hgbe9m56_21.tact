struct SS {
    x: Int;
    y: Bool;
    z: String;
}

contract MultiStructs {
    s1: SS;
    s2: SS;
    s3: SS;
    s4: SS;

    init() {
        self.s1=SS{x:1,y:true,z:"a"};
        self.s2=SS{x:2,y:false,z:"b"};
        self.s3=SS{x:3,y:true,z:"c"};
        self.s4=SS{x:4,y:false,z:"d"};
    }
}
