struct WithBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract ManyBools {
    flags: WithBool;
    init() {
        self.flags = WithBool{a:true,b:false,c:true,d:false,e:true};
    }
}