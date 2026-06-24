struct ManyBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
}

contract PackedBools {
    store: ManyBool;

    init() {
        self.store = ManyBool{
            a:true,b:true,c:true,d:true,e:true,
            f:false,g:false,h:false,i:false,j:false
        };
    }
}