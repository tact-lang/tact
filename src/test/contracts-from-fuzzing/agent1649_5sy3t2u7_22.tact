// deeply nested optional inside nested struct
struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    branch: Branch?;
}

contract NestedOptionals {
    data: Root;

    init() {
        self.data = Root{ branch: null };
    }
}