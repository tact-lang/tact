// deeply nested with optionals and alternated types
struct Leaf {
    val: Bool?;
}

struct Branch {
    leaf: Leaf?;
    number: Int?;
}

struct Root {
    branch: Branch?;
    text: String?;
    flag: Bool;
}

contract DeeplyNested {
    storage: Root;

    init() {
        self.storage = Root{
            branch: null,
            text: null,
            flag: true
        };
    }
}