struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ContainsOptional {
    nested: NestedOptional?;
    flag: Bool;
}

contract TestContract {
    val: ContainsOptional;

    init() {
        self.val = ContainsOptional{
            nested: null,
            flag: true
        };
    }

    receive() {}
}