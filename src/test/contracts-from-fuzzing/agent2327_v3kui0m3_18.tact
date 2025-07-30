struct Deep {
    lv1: Int;
    lv2: Mid;
}

struct Mid {
    mv1: Int;
    mv2: Leaf;
}

struct Leaf {
    val: Int;
}

contract DeepStorage {
    storage: Deep;

    init() {
        self.storage = Deep{
            lv1:1,
            lv2: Mid{
                mv1:2,
                mv2: Leaf{
                    val:3
                }
            }
        };
    }
}
