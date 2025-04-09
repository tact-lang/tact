struct RepeatedTypes {
    x: Int;
    y: Int;
    z: Int;
    a: Bool;
    b: Bool;
    c: Bool;
}

contract ManySimilarFields {
    s: RepeatedTypes;
    int1: Int;
    int2: Int;
    int3: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;

    init() {
        self.s = RepeatedTypes{x:1,y:2,z:3,a:true,b:false,c:true};
        self.int1 = 10;
        self.int2 = 20;
        self.int3 = 30;
        self.bool1 = true;
        self.bool2 = false;
        self.bool3 = true;
    }
}