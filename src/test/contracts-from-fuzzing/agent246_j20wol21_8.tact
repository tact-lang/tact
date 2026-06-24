struct OptionLayer {
    inner: Int?;
    note: String?;
}

struct HasOptionLayer {
    ol: OptionLayer;
    status: Bool;
}

contract OptionalInNested {
    storage: HasOptionLayer;

    init() {
        self.storage = HasOptionLayer{
            ol: OptionLayer{
                inner: 123,
                note: null,
            },
            status: true,
        };
    }
}
