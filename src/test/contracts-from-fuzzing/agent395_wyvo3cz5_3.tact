struct LargeNested {
    a: Inner1;
    b: Inner2;
    c: Inner3;
}

struct Inner1 {
    x: Int;
    y: Bool;
}

struct Inner2 {
    p: String;
    q: Int?;
}

struct Inner3 {
    z: Bool?;
    w: String;
}

contract LargeContract {
    val: LargeNested;
    init() {
        self.val = LargeNested{
            a: Inner1{x:1,y:true},
            b: Inner2{p:"hi", q:42},
            c: Inner3{z:false,w:"bye"}
        };
    }
}
