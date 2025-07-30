struct BoolNest {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

contract ManyBools {
    nested: BoolNest;
    b5: Bool;
    b6: Bool;

    init() {
        self.nested = BoolNest{b1:true,b2:false,b3:true,b4:false};
        self.b5 = true;
        self.b6 = false;
    }
}