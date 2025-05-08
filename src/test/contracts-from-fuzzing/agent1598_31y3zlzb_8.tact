struct InnerS {
    f1: Int;
    f2: Bool;
}

struct Outer {
    inn: InnerS;
    s: String;
    flag: Bool?;
}

contract ManyStructs {
    o1: Outer;
    o2: Outer;
    init() {
        self.o1 = Outer{inn: InnerS{f1:1, f2:true}, s:"a", flag:null};
        self.o2 = Outer{inn: InnerS{f1:2, f2:false}, s:"b", flag:true};
    }
}