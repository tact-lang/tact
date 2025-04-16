struct Corpse {
    flag: Bool;
    message: Message?;
}

struct Message {
    text: String;
    code: Int;
}

contract OptionalNestedStruct {
    data: Corpse;

    init() {
        self.data = Corpse{
            flag: true,
            message: Message{
                text: "Error",
                code: 404
            }
        };
    }
}
