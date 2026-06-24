struct P1 { x:Int }
struct P2 { y:Int }
struct P3 { z:Int }

struct ManyNested {
    f1: P1;
    f2: P2;
    f3: P3;
}

contract NestedMany {
    val: ManyNested;
    init() {
        self.val = ManyNested{
            f1:P1{x:1},
            f2:P2{y:2},
            f3:P3{z:3}
        };
    }
}
