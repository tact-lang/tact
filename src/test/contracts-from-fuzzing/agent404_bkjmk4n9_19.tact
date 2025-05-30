struct Composed {
    x: Int;
    y: Int;
    z: Int;
}

contract FieldsWithStructs {
    s1: Composed;
    s2: Composed;
    i: Int;
    b: Bool;
    t: String;
    opt: Int?;
    optStruct: Composed?;
    init() {
        self.s1 = Composed{x:1,y:2,z:3};
        self.s2 = Composed{x:4,y:5,z:6};
        self.i = 7;
        self.b = true;
        self.t = "test";
        self.opt = null;
        self.optStruct = null;
    }
}