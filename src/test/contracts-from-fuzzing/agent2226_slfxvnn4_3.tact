struct Leaf {
    value: Int?;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Root {
    main: Branch;
    aux: Branch;
}

contract DeepNestedOptional {
    root: Root;
    init() {
        self.root = Root{
            main: Branch{
                left: Leaf{ value: null },
                right: Leaf{ value: 1 }
            },
            aux: Branch{
                left: Leaf{ value: 2 },
                right: Leaf{ value: null }
            }
        };
    }
}