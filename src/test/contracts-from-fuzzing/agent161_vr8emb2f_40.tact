// Deeply nested optional inside non-optional struct wrapping optional struct

struct OptLeaf {
    v: Int?;
}

struct MidWrap {
    leaf: OptLeaf?;
}

struct RootStruct {
    mid: MidWrap;
    label: String;
}

contract DeepWrapOpt {
    val: RootStruct;
    init() {
        self.val = RootStruct{
            mid: MidWrap{
                leaf: null,
            },
            label: "deepopt",
        };
    }
}
