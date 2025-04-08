struct Multi {
    a: Int;
    b: Bool;
    c: String;
}

contract MultiFields {
    m1: Multi;
    m2: Multi;
    m3: Multi;
    m4: Multi;
    m5: Multi;

    init() {
        self.m1=Multi{a:1,b:true,c:"a"};
        self.m2=Multi{a:2,b:false,c:"b"};
        self.m3=Multi{a:3,b:true,c:"c"};
        self.m4=Multi{a:4,b:false,c:"d"};
        self.m5=Multi{a:5,b:true,c:"e"};
    }
}