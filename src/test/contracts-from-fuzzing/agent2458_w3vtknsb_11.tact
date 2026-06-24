// Deep chain nested optionals with several layers and mixed optional/null
struct Leaf {
    val: Int?;
}

struct Mid {
    leaf: Leaf?;
}

struct Root {
    mid: Mid?;
}

contract TestContract {
    data: Root;

    init() {
        self.data = Root{
            mid: Mid{
                leaf: null
            }
        };
    }
}