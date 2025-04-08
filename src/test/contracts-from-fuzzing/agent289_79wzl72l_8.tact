struct NestedWithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct TopWithNestedOpt {
    inner: NestedWithOptionals;
    label: String;
    flag: Bool;
}

contract NestedOptionPersistent {
    data: TopWithNestedOpt;

    init() {
        self.data = TopWithNestedOpt{
            inner: NestedWithOptionals{
                a: null,
                b: null,
                c: null,
                d: null
            },
            label: "label",
            flag: true
        };
    }
}