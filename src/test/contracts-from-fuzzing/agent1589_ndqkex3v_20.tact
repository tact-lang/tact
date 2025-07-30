struct ComposeOptional {
    nested: Inner?;
    flag: Bool;
}

struct Inner {
    val: Int;
    text: String?;
}

contract StructWithOptionalStruct {
    data: ComposeOptional;

    init() {
        self.data = ComposeOptional{
            nested: Inner{
                val: 7,
                text: null,
            },
            flag: false,
        };
    }
}