struct NestedStringOpt {
    text: String?;
}

struct WithNestedStrOpt {
    nested: NestedStringOpt;
    moreText: String?;
}

contract StringOptionals {
    data: WithNestedStrOpt;

    init() {
        self.data = WithNestedStrOpt{
            nested: NestedStringOpt{
                text: null,
            },
            moreText: "hello",
        };
    }
}