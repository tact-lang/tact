struct Leaf {
    x: Int;
}

struct Middle1 {
    a: Leaf;
}

struct Middle2 {
    b: Middle1;
}

struct Middle3 {
    c: Middle2;
}

contract DeepStorage {
    val: Middle3;

    init() {
        self.val = Middle3{c: Middle2{b: Middle1{a: Leaf{x: 42}}}};
    }
}