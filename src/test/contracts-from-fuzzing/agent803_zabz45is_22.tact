struct NestedOptional {
    s: String?;
}

struct ContainsNestedOptional {
    nested: NestedOptional;
    flag: Bool;
}

contract NestedDefaultNull {
    v: ContainsNestedOptional;
    init() {
        self.v = ContainsNestedOptional{
            nested: NestedOptional{ s:null },
            flag: false
        };
    }
}