struct SubDeep {
    a: Int;
    b: Bool;
}

struct MidDeep {
    s1: SubDeep;
    s2: SubDeep;
}

contract NestedContract {
    m1: MidDeep;
    m2: MidDeep;
    m3: MidDeep;

    init() {
        self.m1 = MidDeep{s1:SubDeep{a:1,b:true},s2:SubDeep{a:2,b:false}};
        self.m2 = MidDeep{s1:SubDeep{a:3,b:true},s2:SubDeep{a:4,b:false}};
        self.m3 = MidDeep{s1:SubDeep{a:5,b:true},s2:SubDeep{a:6,b:false}};
    }
}