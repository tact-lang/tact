struct WithFlags {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
}

contract FlagOpt {
    f: WithFlags;
    init() {
        self.f = WithFlags{a:true,b:null,c:false,d:null};
    }
}