struct MixedOptDef {
    a: Int;           
    b: Int?;          
    c: Int? = null;   
    d: Bool = true;   
}

contract Test {
    m: MixedOptDef;

    init() {
        self.m = MixedOptDef{ a:1 };
    }
}