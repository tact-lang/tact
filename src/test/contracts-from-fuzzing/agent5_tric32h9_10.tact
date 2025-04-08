struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf?;
    flag: Bool;
}

contract OptionalNestedStructs {
    b: Branch?;

    init() {
        self.b = Branch{
            leaf: Leaf{
                val: 99,
            },
            flag: false,
        };
    }
}