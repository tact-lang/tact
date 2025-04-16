struct L {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct M {
    l1: L?;
    l2: L?;
}

contract NestedNulls {
    m: M;

    init() {
        self.m = M{
            l1: null,
            l2: L{ a:null, b:true, c:null },
        };
    }
}