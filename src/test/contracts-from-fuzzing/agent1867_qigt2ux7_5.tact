struct LargeNested {
    nested1: Inner1;
    nested2: Inner2;
}

struct Inner1 {
    a: Int;
    b: Int;
    c: Bool;
    d: Int?;
}

struct Inner2 {
    x: Bool;
    y: Int;
    z: Bool?;
}

contract BigNest {
    data: LargeNested;
    init() {
        self.data = LargeNested{
            nested1: Inner1{a:1,b:2,c:true,d:null},
            nested2: Inner2{x:false,y:3,z:true}
        };
    }
}