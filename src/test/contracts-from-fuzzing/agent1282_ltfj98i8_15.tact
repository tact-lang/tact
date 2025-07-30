struct BoolWrap {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract BitsPacking {
    flags: BoolWrap;

    init() {
        self.flags = BoolWrap{
            a:true,b:false,c:true,d:false,
            e:true,f:false,g:true,h:false
        };
    }
}