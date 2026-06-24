// Nested string fields inside nested structs
struct Deep {
    text: String;
}

struct OuterMost {
    d1: Deep;
    d2: Deep;
}

contract NestedStrings {
    val: OuterMost;

    init() {
        self.val = OuterMost{
            d1: Deep{ text: "A" },
            d2: Deep{ text: "B" }
        };
    }
}