struct OnlyBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
}

contract BoolStore {
    flags: OnlyBools;
    init() {
        self.flags = OnlyBools{
            a:true,b:true,c:false,d:true,e:false,f:true,g:true,h:false,i:true
        };
    }
}
