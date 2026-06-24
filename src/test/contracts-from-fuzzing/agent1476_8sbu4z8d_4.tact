struct OptionalStruct {
    info: Int;
    note: String?;
}

contract OptionalStructStorage {
    content: OptionalStruct;

    init() {
        self.content = OptionalStruct{
            info: 5,
            note: null,
        };
    }
}