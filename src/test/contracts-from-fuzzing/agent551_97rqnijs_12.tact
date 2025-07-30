struct Leaf {
    val: Int;
}

struct Middle {
    leaf: Leaf?;
}

struct Root {
    mid: Middle?;
}

contract TestContract {
    deepOpt: Root?;

    init() {
        self.deepOpt = Root{
            mid: Middle{
                leaf: Leaf{ val: 99 },
            },
        };
    }
}