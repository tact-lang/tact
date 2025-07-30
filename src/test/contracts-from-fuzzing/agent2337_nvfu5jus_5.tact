struct Leaf {
    z: Bool?;
}

struct Middle {
    leaf: Leaf?;
}

struct Outer {
    middle: Middle?;
}

contract DeepOptionalNested {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}