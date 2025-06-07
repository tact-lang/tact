struct Leaf {
    num: Int;
}

struct Branch {
    leaf: Leaf;
    flag: Bool;
}

struct Trunk {
    branch: Branch;
    label: String;
}

struct Root {
    trunk: Trunk;
    extra: Bool;
}

contract NestedThreeDeep {
    data: Root;

    init() {
        self.data = Root{
            trunk: Trunk{
                branch: Branch{
                    leaf: Leaf{ num: 123 },
                    flag: true
                },
                label: "deep"
            },
            extra: false
        };
    }
}