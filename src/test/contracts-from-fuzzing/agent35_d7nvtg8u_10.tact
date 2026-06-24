struct OptionalStruct {
    a: Int;
    b: Bool;
    s: String;
   
    c: Cell?;
    d: Slice?;
    e: String?;
    f: Int?;
    g: Bool?;
}

contract OptionalStructs {
    f1: OptionalStruct?;
    f2: OptionalStruct?;
    
    init() {
        self.f1 = null;
        self.f2 = null;
    }
}