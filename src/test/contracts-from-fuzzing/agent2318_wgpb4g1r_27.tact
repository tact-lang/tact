struct Combo {
    a: Int;
    b: String?;
    c: Bool;
    d: Int?;
    e: Inner;
    f: Inner?;
}

struct Inner {
    x: Int;
    y: String;
}

contract TestContract {
    data: Combo = Combo{
        a:1,b:null,c:true,d:null,
        e:Inner{x:1,y:"a"},
        f:null
    };

    init() {
        self.data = Combo{
            a:42,
            b:"str",
            c:false,
            d:5,
            e:Inner{x:7,y:"zzz"},
            f:Inner{x:9,y:"yo"}
        };
    }
}
