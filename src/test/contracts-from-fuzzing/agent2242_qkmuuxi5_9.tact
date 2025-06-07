struct Child1 { x: Int; }
struct Child2 { y: Bool; }
struct Child3 { z: String; }

struct Parent {
    c1: Child1;
    c2: Child2;
    c3: Child3;
}

contract DeepMix {
    val: Parent;

    init() {
        self.val = Parent{
            c1: Child1{x: 5},
            c2: Child2{y: true},
            c3: Child3{z: "hello"}
        };
    }
}