struct Leaf {
    value: Int as int64;
    flag: Bool;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
    number: Int;
}

contract DeepNestedOptional {
    branch: Branch;

    init() {
        self.branch = Branch{
            left: null,
            right: Leaf{ value: -5, flag: true },
            number: 99,
        };
    }
}