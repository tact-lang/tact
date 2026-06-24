// Enormous struct tree with wide and deep optional branches
struct Outermost {
    left: Mid?;
    right: Mid?;
}
struct Mid {
    leaf1: Leaf?;
    leaf2: Leaf?;
    text: String?;
}
struct Leaf {
    i: Int?;
    b: Bool?;
}

contract Enormous {
    node: Outermost;

    init() {
        self.node = Outermost{
            left:null,
            right:null
        };
    }
}