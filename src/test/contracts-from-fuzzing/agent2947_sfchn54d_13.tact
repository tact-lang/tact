struct Leaf { leafVal: Int; }

struct Middle1 { mval: Leaf; }
struct Middle2 { mval: Leaf; }
struct Middle3 { mval: Leaf; }

struct Top {
    m1: Middle1;
    m2: Middle2;
    m3: Middle3;
}

contract WideNested {
    val: Top;

    init() {
        self.val = Top{
            m1: Middle1{ mval: Leaf{ leafVal: 1 } },
            m2: Middle2{ mval: Leaf{ leafVal: 2 } },
            m3: Middle3{ mval: Leaf{ leafVal:3 } }
        };
    }
}