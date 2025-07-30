struct Leaf {
    val: String;
}

struct L2 {
    l: Leaf;
}

struct L3 {
    l2: L2;
}

struct L4 {
    l3: L3;
}

contract SuperDeepNest {
    value: L4;

    init() {
        self.value = L4{
            l3: L3{
                l2: L2{
                    l: Leaf{ val: "deepest" }
                }
            }
        };
    }
}
