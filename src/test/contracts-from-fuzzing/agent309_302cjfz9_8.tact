struct BigNestedOpt {
    innerOpt: InnerOpt?;
    label: String;
}

struct InnerOpt {
    foo: Int?;
    bar: Bool;
}

struct Combo {
    nested: BigNestedOpt;
    text: String;
}

contract NestedEmbedStruct {
    val: Combo;

    init() {
        self.val = Combo{
            nested: BigNestedOpt{
                innerOpt: InnerOpt{
                    foo: null,
                    bar: true
                },
                label: "nested label"
            },
            text: "combo text"
        };
    }
}