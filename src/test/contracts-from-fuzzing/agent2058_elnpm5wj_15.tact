struct BigNested {
    sub1: S1;
    sub2: S2;
}

struct S1 { foo: Int; bar: String; zig: Bool }

struct S2 { z1: S1; z2: S1 }

contract Test {
    n: BigNested;
    
    init() {
        self.n = BigNested{
            sub1: S1{foo:1,bar:"a",zig:true},
            sub2: S2{
                z1: S1{foo:2,bar:"b",zig:false},
                z2: S1{foo:3,bar:"c",zig:true}
            }
        };
    }
}