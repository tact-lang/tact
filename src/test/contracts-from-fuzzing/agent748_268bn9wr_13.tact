struct OptTail {
    name: String;
    meta: String?;
    note: String?;
    label: String?;
}

contract OptionalTrailingStruct {
    stuff: OptTail;

    init() {
        self.stuff = OptTail{
            name: "main",
            meta: null,
            note: null,
            label: "hi",
        };
    }
}
