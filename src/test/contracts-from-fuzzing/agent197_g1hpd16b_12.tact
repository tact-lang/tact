struct Leaf {
    x: Int? = null;
    y: Int? = null;
}
struct Mid {
    leaf1: Leaf = Leaf{ x: null, y: null };
    leaf2: Leaf = Leaf{ x: null, y: null };
}
struct Root {
    mid1: Mid = Mid{ leaf1: Leaf{ x: null, y: null }, leaf2: Leaf{ x: null, y: null } };
    mid2: Mid = Mid{ leaf1: Leaf{ x: null, y: null }, leaf2: Leaf{ x: null, y: null } };
}

contract DeepWide {
    big: Root = Root{
        mid1: Mid{ leaf1: Leaf{ x: null, y: null }, leaf2: Leaf{ x: null, y: null } },
        mid2: Mid{ leaf1: Leaf{ x: null, y: null }, leaf2: Leaf{ x: null, y: null } }
    };
}