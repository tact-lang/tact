struct Outermost {
    l1: Int;
    l2: Mid;
}

struct Mid {
    l3: Int?;
    l4: Leaf;
}

struct Leaf {
    l5: Bool?;
    l6: String;
}

contract DeepOptional {
    tree: Outermost;

    init() {
        self.tree = Outermost{
            l1: 100,
            l2: Mid{
                l3: null,
                l4: Leaf{
                    l5: null,
                    l6: "leaf"
                }
            }
        };
    }
}