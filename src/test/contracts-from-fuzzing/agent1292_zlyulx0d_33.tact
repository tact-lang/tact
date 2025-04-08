struct OnlyBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract DenseBools {
    val: OnlyBool;

    init() {
        self.val = OnlyBool{
            a:true,b:false,c:true,d:false,e:true,f:false,g:true,h:false
        };
    }
}