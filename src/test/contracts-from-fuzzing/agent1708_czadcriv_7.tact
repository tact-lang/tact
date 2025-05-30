struct ComposeOptionalAndNested {
    optInt: Int?;
    nested: NestedL1;
}

struct NestedL1 {
    optStr: String?;
    nested2: NestedL2;
}

struct NestedL2 {
    addr: Address?;
    val: Int;
}

contract TestContract {
    field: ComposeOptionalAndNested;

    init() {
        self.field = ComposeOptionalAndNested{
            optInt: null,
            nested: NestedL1{
                optStr: "hi",
                nested2: NestedL2 {
                    addr: null,
                    val: 77
                }
            }
        };
    }
}