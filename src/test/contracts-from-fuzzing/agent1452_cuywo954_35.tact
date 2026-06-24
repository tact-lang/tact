struct NestedCompose {
    inner: Compose;
    another: Compose?;
}

struct Compose {
    number: Int;
    flag: Bool;
    text: String;
    optNumber: Int?;
    optFlag: Bool?;
    optText: String?;
}

contract NestedComposeStorage {
    field: NestedCompose;

    init() {
        self.field = NestedCompose{
            inner: Compose{
                number: 1,
                flag: true,
                text: "hi",
                optNumber: null,
                optFlag: null,
                optText: null
            },
            another: null
        };
    }
}
