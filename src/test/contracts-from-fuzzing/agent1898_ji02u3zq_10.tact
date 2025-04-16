struct OptionalNested {
    i: Int?;
    s: String?;
}

struct OptionalContainer {
    nested: OptionalNested?;
    flag: Bool?;
}

contract OptionalDeepNesting {
    val: OptionalContainer;

    init() {
        self.val = OptionalContainer{
            nested: null,
            flag: null
        };
    }
}