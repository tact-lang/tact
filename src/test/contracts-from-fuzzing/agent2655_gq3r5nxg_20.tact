struct Leaf1 { x: Int }
struct Leaf2 { y: Bool }
struct MidS {
    l1: Leaf1?;
    l2: Leaf2?;
}

contract WideNullableNest {
    mid: MidS?;

    init() {
        self.mid = null;
    }
}