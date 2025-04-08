struct SubBool {
    b1: Bool;
    b2: Bool;
}

contract ManyBools {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    nested: SubBool;

    init() {
        self.f1 = true;
        self.f2 = false;
        self.f3 = true;
        self.f4 = false;
        self.nested = SubBool{b1:true,b2:false};
    }
}