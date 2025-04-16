struct Leaf {
    flag: Bool = false;
    text: String = "leaf";
    value: Int?;
}

struct Mid {
    number: Int = 10;
    leaf: Leaf?;
}

contract NestedDefaultsTest {
    mid: Mid;

    init() {
        self.mid = Mid{
            number: 99,
            leaf: Leaf{
                flag: true,
                text: "override",
                value: null,
            }
        };
    }
}
