struct InnerMost {
    v: Int;
}

struct MidLevel {
    a: Int;
    b: Bool;
    c: String;
    d: InnerMost;
}

struct TopLevel {
    first: MidLevel;
    second: MidLevel;
}

contract NestedTuple {
    store: TopLevel;

    init() {
        self.store = TopLevel{
            first: MidLevel{a:1,b:true,c:"q",d:InnerMost{v:7}},
            second: MidLevel{a:2,b:false,c:"w",d:InnerMost{v:8}}
        };
    }
}