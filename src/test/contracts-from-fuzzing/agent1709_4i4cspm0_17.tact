struct StructA {
    a: Int;
    b: Bool;
}

struct StructB {
    b: Bool;
    s: String;
}

contract MultiStructs {
    s1: StructA;
    s2: StructB;

    init() {
        self.s1 = StructA{a:1,b:true};
        self.s2 = StructB{b:false,s:"xx"};
    }
}