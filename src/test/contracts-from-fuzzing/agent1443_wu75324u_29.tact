struct Leaf {
    x: Int?; // implicit null
}

struct Mid {
    leaf: Leaf;
    y: Bool;
}

struct Root {
    mid: Mid;
    z: String;
}

contract PartialDeepDefaults {
    val: Root;

    init() {
        self.val = Root{
            mid: Mid{
                leaf: Leaf{}, // x omitted
                y: true,
            },
            z: "abc",
        };
    }
}