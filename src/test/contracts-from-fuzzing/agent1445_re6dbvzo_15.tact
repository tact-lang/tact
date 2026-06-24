struct SubNested {
    label: String;
    amount: Int;
    status: Bool;
}

struct Nested {
    id: Int;
    info: SubNested;
}

contract DoubleEmbedded {
    record: Nested;

    init() {
        self.record = Nested{
            id: 1234,
            info: SubNested{
                label: "label",
                amount: 321,
                status: true,
            },
        };
    }
}