struct Leaf {
    v: Int?;
}

struct Mid {
    l1: Leaf?;
    l2: Leaf?;
}

contract DeepOptionTest {
    val: Mid?;

    init() {
        self.val = Mid{
            l1: Leaf{ v: null },
            l2: null,
        };
    }
}