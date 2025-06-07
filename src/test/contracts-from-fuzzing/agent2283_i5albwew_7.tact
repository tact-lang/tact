struct OptionalNested {
    val: Int?;
    flag: Bool?;
    txt: String?;
}

struct ContainingOptional {
    inner1: OptionalNested?;
    inner2: OptionalNested?;
}

contract OptionalNestedContract {
    nested: ContainingOptional;

    init() {
        self.nested = ContainingOptional{
            inner1: null,
            inner2: null
        };
    }
}
