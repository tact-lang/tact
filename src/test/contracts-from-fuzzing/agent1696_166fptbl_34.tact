struct Leaf {
    val: Int?;
    flag: Bool = true;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    child: Branch?;
    title: String;
}

contract DeepOptionalTree {
    data: Root;

    init() {
        self.data = Root{
            child: Branch{
                left: Leaf{ val: 1 },
                right: null
            },
            title: "Tree"
        };
    }
}