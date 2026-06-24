struct NestedSeveral {
    a: Inner1;
    b: Inner2;
}

struct Inner1 {
    x: Int;
    y: Int?;
}

struct Inner2 {
    m: Bool;
    n: String?;
}

contract MultiNested {
    v: NestedSeveral;

    init() {
        self.v = NestedSeveral{
            a: Inner1{x:1,y:null},
            b: Inner2{m:true,n:null},
        };
    }
}
