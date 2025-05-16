struct SDeepOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;
}

contract NestedDeepOptions {
    s1: SDeepOpt;
    s2: SDeepOpt;
    init() {
        self.s1 = SDeepOpt{a:null,b:null,c:null,d:1,e:true,f:"x"};
        self.s2 = SDeepOpt{a:null,b:null,c:null,d:2,e:false,f:"y"};
    }
}