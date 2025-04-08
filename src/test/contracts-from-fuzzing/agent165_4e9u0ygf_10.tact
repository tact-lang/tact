struct Leaf {
    num: Int;
    flag: Bool?;
}

struct Branch {
    leaf: Leaf;
    text: String? = "hey";
}

contract OptionalsMix {
    root: Branch?;

    init() {
        self.root = Branch{
            leaf: Leaf{
                num: 7,
                // omit flag -> null
            },
            // omit text -> "hey"
        };
    }
}