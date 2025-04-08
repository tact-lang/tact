struct Leaf {
    leafVal: Int?;
}

struct Mid {
    midVal: Bool?;
    leaf: Leaf?;
}

struct Root {
    intVal: Int;
    mid: Mid?;
}

contract DeepOptNestStorage {
    data: Root;

    init() {
        self.data = Root{
            intVal: 99,
            mid: Mid{
                midVal: false,
                leaf: Leaf{
                    leafVal: 123
                }
            }
        };
    }
}