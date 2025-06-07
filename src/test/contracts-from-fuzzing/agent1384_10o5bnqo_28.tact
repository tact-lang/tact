struct NestedDeepOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct SuperNested {
    inner1: NestedDeepOpt;
    inner2: NestedDeepOpt;
}

contract DeepOptionals {
    s: SuperNested;

    init() {
        self.s = SuperNested{
            inner1: NestedDeepOpt{a:1,b:true,c:null},
            inner2: NestedDeepOpt{a:null,b:null,c:"hello"},
        };
    }
}