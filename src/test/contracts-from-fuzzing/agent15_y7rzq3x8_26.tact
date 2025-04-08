struct DeepInner {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
}

struct Inner {
    e: Bool;
    f: String?;
    g: DeepInner;
}

contract TestContract {
    inner1: Inner;
    inner2: Inner;

    init() {
        self.inner1 = Inner{
            e:true, f:null, g:DeepInner{a:1,b:2,c:true,d:"d1"}
        };
        self.inner2 = Inner{
            e:false, f:"f", g:DeepInner{a:3,b:4,c:false,d:"d2"}
        };
    }
}