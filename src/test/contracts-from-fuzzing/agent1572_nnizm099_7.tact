struct BigNestInner {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: String;
    f5: String?;
}

struct BigNest {
    n1: BigNestInner;
    n2: BigNestInner?;
    n3: BigNestInner;
    n4: Bool;
    n5: Int;
    n6: String?;
}

contract BigNestContract {
    holder: BigNest = BigNest{
        n1: BigNestInner{f1: 1, f2:null, f3:true, f4:"a", f5:null},
        n2: null,
        n3: BigNestInner{f1: 7, f2:42, f3:false, f4:"b", f5:"y"},
        n4: true,
        n5: 10,
        n6: null
    };

    init() {
        self.holder = BigNest{
            n1: BigNestInner{f1: 2, f2:3, f3:false, f4:"x", f5: "q"},
            n2: BigNestInner{f1: 5, f2:null, f3:true, f4:"w", f5:null},
            n3: BigNestInner{f1: 8, f2:100, f3:false, f4:"e", f5: "r"},
            n4: false,
            n5: 100,
            n6: "set"
        };
    }
}