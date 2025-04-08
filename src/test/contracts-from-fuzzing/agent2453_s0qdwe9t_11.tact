struct NestedCompound {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: String;
}

contract ManyNestedFields {
    f1: NestedCompound;
    f2: NestedCompound;
    init() {
        self.f1 = NestedCompound{a:1,b:true,c:"a",d:null,e:"A"};
        self.f2 = NestedCompound{a:2,b:false,c:"b",d:3,e:"B"};
    }
}