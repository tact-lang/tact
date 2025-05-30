struct S {
    x: Int;
    y: String;
    f: Bool;
    o1: Int?;
    o2: Bool?;
}

contract Mixed {
    f1: Bool;
    s1: S;
    o3: String?;

    init() {
        self.f1 = false;
        self.s1 = S{x:1,y:"y",f:true,o1:null,o2:true};
        self.o3 = "ok";
    }
}