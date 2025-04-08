struct Base {
    a: Int;
    b: Int?;
    c: Bool;
}

contract OptComp {
    optStruct: Base?;
    plain: Base;

    init() {
        self.optStruct = Base{ a:1, b:null, c:true };
        self.plain = Base{ a:2, b:null, c:false };
    }
}
