struct InnerMost { z: Int; }
struct MiddleA { x: Bool; }
struct MiddleB { y: String; }

struct Outer {
    a: MiddleA;
    b: MiddleB;
    c: InnerMost;
}

contract MultiNested {
    val: Outer;
    init() {
        self.val = Outer{
            a: MiddleA{ x:true },
            b: MiddleB{ y:"hello" },
            c: InnerMost{ z:42 }
        };
    }
}