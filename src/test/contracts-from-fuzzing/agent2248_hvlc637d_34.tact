struct Multi {
    a: Int;
    b: Bool;
    c: String;
}

contract MultiSimple {
    f1: Multi;
    f2: Multi;

    init() {
        self.f1 = Multi{a:1,b:true,c:"x"};
        self.f2 = Multi{a:2,b:false,c:"y"};
    }
}