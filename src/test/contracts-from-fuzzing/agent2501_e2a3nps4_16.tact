struct StrWrapper {
    text: String;
}

struct OptionalStruct {
    content: StrWrapper?;
}

contract OptionalOfStruct {
    state: OptionalStruct;

    init() {
        self.state = OptionalStruct{ content: null };
    }
}