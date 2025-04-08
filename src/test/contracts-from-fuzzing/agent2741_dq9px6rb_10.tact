struct Leaf1 { a: Int; }
struct Leaf2 { b: Bool; }
struct Leaf3 { c: String; }

struct Mid1 { l1: Leaf1; l2: Leaf2; }
struct Mid2 { l3: Leaf3; }

struct Top {
    m1: Mid1;
    m2: Mid2;
}

contract MultiBranch {
    t: Top;

    init() {
        self.t = Top{
            m1: Mid1{ l1: Leaf1{a:1}, l2: Leaf2{b:true} },
            m2: Mid2{ l3: Leaf3{c:"hi"} }
        };
    }
}