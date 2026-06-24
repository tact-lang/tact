struct DeeplyNested {
    val: Int;
    next: Nested?;
}

struct Nested {
    val: Int;
    next: Leaf?;
}

struct Leaf {
    val: Int;
}

contract RecursiveLikeTest {
    root: DeeplyNested;

    init() {
        self.root = DeeplyNested{
            val: 1,
            next: Nested{
                val: 2,
                next: Leaf{
                    val: 3
                }
            }
        };
    }
}