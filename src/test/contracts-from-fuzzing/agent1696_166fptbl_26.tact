struct Leaf {
    z: Int?;
}

struct Middle {
    child: Leaf?;
}

struct Root {
    mid: Middle?;
    s: String?;
}

contract OptionalTreeTest {
    persistent: Root;

    init() {
        self.persistent = Root{
            mid: Middle{ child: Leaf{ z: 42 } },
            s: null
        };
    }
}