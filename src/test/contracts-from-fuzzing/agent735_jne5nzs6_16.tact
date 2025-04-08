struct Leaf {
    a: Int = 99;
    b: Bool = false;
}

struct Branch {
    leaf: Leaf;
    label: String = "branch";
}

contract DefaultsChain {
    data: Branch;

    init() {
        self.data = Branch{
            leaf: Leaf{
                a: 123,
                b: true,
            },
            // omit label, should be "branch"
        };
    }
}
