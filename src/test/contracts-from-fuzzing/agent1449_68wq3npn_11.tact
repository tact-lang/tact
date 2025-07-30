struct BigNested {
    x1: Inner;
    x2: Inner;
    x3: Inner;
    x4: Inner;
    x5: Inner;
    x6: Inner;
    x7: Inner;
    x8: Inner;
    x9: Inner;
    x10:Inner;
}

struct Inner {
    a: Int;
    b: String?;
    c: SubInner;
}

struct SubInner {
    p: Int;
    q: Bool;
    r: String?;
}

contract WideDeepCombo {
    data: BigNested = BigNested{
        x1: Inner{a:1,b:null,c:SubInner{p:0,q:true,r:null}},
        x2: Inner{a:2,b:"b2",c:SubInner{p:1,q:false,r:"r2"}},
        x3: Inner{a:3,b:null,c:SubInner{p:2,q:true,r:null}},
        x4: Inner{a:4,b:null,c:SubInner{p:3,q:false,r:null}},
        x5: Inner{a:5,b:"b5",c:SubInner{p:4,q:true,r:"r5"}},
        x6: Inner{a:6,b:null,c:SubInner{p:5,q:false,r:null}},
        x7: Inner{a:7,b:null,c:SubInner{p:6,q:true,r:null}},
        x8: Inner{a:8,b:null,c:SubInner{p:7,q:false,r:null}},
        x9: Inner{a:9,b:null,c:SubInner{p:8,q:true,r:null}},
        x10:Inner{a:10,b:null,c:SubInner{p:9,q:false,r:null}}
    };

    init() {
        self.data = self.data; // just keep same
    }
}
