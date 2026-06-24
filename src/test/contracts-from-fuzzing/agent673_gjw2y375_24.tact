struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf?;
    flag: Bool;
}

contract TestContract {
    field: Branch?;

    init() {
        self.field = Branch{
            leaf: null,
            flag: true
        };
    }
}