struct Combo {
    a: Int;
    b: Bool;
    sub: SubStruct;
}

struct SubStruct {
    u: Int?;
    v: String;
    w: Bool?;
}

contract Persists {
    field1: Int;
    field2: SubStruct;
    field3: Combo;

    init() {
        self.field1 = 42;
        self.field2 = SubStruct{ u:null, v:"vvv", w:true };
        self.field3 = Combo{ a:1, b:false, sub:self.field2 };
    }
}