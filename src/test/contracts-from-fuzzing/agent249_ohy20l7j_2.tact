struct NestedDeep {
    a: Int;
    b: Bool;
    c: String;
}

struct Mid {
    na: NestedDeep;
    optNb: NestedDeep?;
    optInt: Int?;
}

struct High {
    m1: Mid;
    m2: Mid;
}

contract DeepNestTest {
    h: High;
    optMid: Mid?;
    optNd: NestedDeep?;

    init() {
        self.h = High{
            m1: Mid{na: NestedDeep{a:1,b:true,c:"xx"}, optNb:null, optInt:null},
            m2: Mid{na: NestedDeep{a:2,b:false,c:"yy"}, optNb:null, optInt:null}
        };
        self.optMid = null;
        self.optNd = null;
    }
}
