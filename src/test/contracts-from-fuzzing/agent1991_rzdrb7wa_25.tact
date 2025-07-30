struct ComposeOptional {
    foo: Int?;
}

struct NestedCompose {
    bar: ComposeOptional;
}

contract OptionalInNestedStruct {
    nested: NestedCompose;

    init() {
        self.nested = NestedCompose{ bar: ComposeOptional{ foo:null } };
    }
}