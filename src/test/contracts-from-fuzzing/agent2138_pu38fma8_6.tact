struct BigNest {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
}

struct Container {
    s1: BigNest;
    s2: BigNest;
    s3: BigNest;
}

contract MultiBigNest {
    storage: Container;

    init() {
        self.storage = Container{
            s1: BigNest{a:1, b:true, c:null, d:false, e:2},
            s2: BigNest{a:3, b:false, c:4, d:null, e:5},
            s3: BigNest{a:6, b:true, c:null, d:null, e:7},
        };
    }
}