struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct TopLevel {
    nested: NestedOptional?;
    flag: Bool;
}

contract TestContract {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            nested: null,
            flag: true
        };
    }
}