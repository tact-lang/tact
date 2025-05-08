struct NestedMix {
    a: Int;
    b: Bool?;
    c: Int?;
    d: Bool;
    e: Int;
}

struct OuterMix {
    x: NestedMix;
    y: NestedMix;
}

contract TestMixes {
    data: OuterMix;

    init() {
        self.data = OuterMix{
            x: NestedMix{ a:1,b:null,c:null,d:true,e:5 },
            y: NestedMix{ a:42,b:false,c:999,d:false,e:0 }
        };
    }
}