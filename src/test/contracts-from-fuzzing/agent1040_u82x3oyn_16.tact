struct MessageData {
    txt: String;
    flag: Bool;
}

struct WithStructs {
    first: MessageData;
    second: MessageData;
}

contract MultiStructFields {
    s: WithStructs;

    init() {
        self.s = WithStructs{
            first: MessageData{ txt: "hello", flag: true },
            second: MessageData{ txt: "world", flag: false },
        };
    }
}