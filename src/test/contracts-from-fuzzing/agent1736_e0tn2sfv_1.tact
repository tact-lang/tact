struct InnerNested {
    flag: Bool;
    amount: Int?;
}

struct OuterNested {
    nested: InnerNested;
    label: String;
}

contract TestDeepNested {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            nested: InnerNested{
                flag: true,
                amount: null,
            },
            label: "deepnest"
        };
    }
}