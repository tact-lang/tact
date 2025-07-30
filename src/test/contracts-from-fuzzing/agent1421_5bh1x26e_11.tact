struct Leaf {
    z: String?;
}

struct Middle {
    leaf: Leaf?;
}

contract DeeplyNestedOptionals {
    middle: Middle?;

    init() {
        self.middle = null;
    }
}