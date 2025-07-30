// deeply nested optional and struct with many optional leaf nodes
struct Leaf {
    val: Int?;
}

struct Mid {
    l1: Leaf?;
    l2: Leaf?;
}

struct Root {
    m1: Mid?;
    m2: Mid?;
}

contract TestContract {
    storage: Root;
    init() {
        self.storage = Root{
            m1: null,
            m2: Mid{
                l1: null,
                l2: Leaf{val: 42}
            }
        };
    }
}
