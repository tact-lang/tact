struct Big {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Int; g: Int; h: Int; i: Int; j: Int;
}

contract BigVars {
    a: Int; b: Bool; c: String; d: Int?;
    e: String; f: Bool?; g: Int; h: String;
    big1: Big;
    big2: Big;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = null;
        self.e = "y";
        self.f = false;
        self.g = 2;
        self.h = "z";
        self.big1 = Big{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10};
        self.big2 = Big{a:11,b:12,c:13,d:14,e:15,f:16,g:17,h:18,i:19,j:20};
    }
}