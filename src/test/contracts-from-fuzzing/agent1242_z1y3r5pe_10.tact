struct NestedOptional {
    opt1: Int?;
    opt2: Bool?;
}

struct OuterOpt {
    nested: NestedOptional?;
    s: String;
}

contract Test {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested: null,
            s: "abc",
        };
    }
}
