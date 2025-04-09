struct InnerS {
    a: Int;
    b: Bool;
}

contract DualStruct {
    s1: InnerS;
    s2: InnerS;

    init() {
        self.s1 = InnerS{a:1,b:true};
        self.s2 = InnerS{a:2,b:false};
    }
}