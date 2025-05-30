struct Leaf {
    val: Int?;
}

struct Mid {
    leaf: Leaf?;
    flag: Bool?;
}

struct Root {
    mid: Mid?;
    text: String?;
}

contract TestContract {
    rootData: Root;
    init() {
        self.rootData = Root{
            mid: null,
            text: null
        };
    }
}
