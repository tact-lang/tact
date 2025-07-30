struct BigTier1 {
    a:Int;
    b:Int;
    c:Int;
    d:Int;
    e:Int;
}

struct BigTier2 {
    t1: BigTier1;
    t2: BigTier1;
    f: Int;
}

contract WideNested {
    state: BigTier2;
    init() {
        self.state = BigTier2{
            t1: BigTier1{a:1,b:2,c:3,d:4,e:5},
            t2: BigTier1{a:6,b:7,c:8,d:9,e:10},
            f: 11
        };
    }
}