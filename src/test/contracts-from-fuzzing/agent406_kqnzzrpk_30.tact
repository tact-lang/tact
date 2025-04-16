struct LargeNested {
    i1: Inner;
    i2: Inner;
    i3: Inner;
    i4: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestContract {
    big: LargeNested;
    init() {
        self.big = LargeNested{
            i1: Inner{ a:1,b:true,c:null },
            i2: Inner{ a:2,b:false,c:null },
            i3: Inner{ a:3,b:true,c:null },
            i4: Inner{ a:4,b:false,c:null }
        };
    }
}