struct Leaf {
    a: Int = 5;
    b: Bool = false;
}

struct Branch {
    leaf: Leaf;
    flag: Bool;
}

contract OverrideNestedDefaults {
    data: Branch;

    init() {
        self.data = Branch{
            leaf: Leaf{ a:10, b:true },
            flag: true
        };
    }
}