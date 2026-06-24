struct MessageWithOnlyOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalStructStorage {
    data: MessageWithOnlyOptional;

    init() {
        self.data = MessageWithOnlyOptional{
            a: 100,
            b: "hi",
            c: true
        };
    }
}