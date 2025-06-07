struct BoolNest {
    b1: Bool;
    b2: Bool;
    b3: Bool;
}

contract BoolMix {
    a: Bool = true;
    b: Bool = false;
    nested: BoolNest;
    
    init() {
        self.a = false;
        self.b = true;
        self.nested = BoolNest{ b1:true, b2:false, b3:true };
    }
}