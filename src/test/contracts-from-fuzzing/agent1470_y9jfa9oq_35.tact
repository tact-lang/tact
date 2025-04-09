// deeply nested optional struct fields plus optionals inside nested structs
struct Leaf {
    s: String?;
    x: Int?;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    branch: Branch?;
}

contract UltraNestedOptionals {
    root: Root;

    init() {
        self.root = Root{
            branch: Branch{
                leaf: Leaf{
                    s: null,
                    x: null,
                },
            },
        };
    }
}