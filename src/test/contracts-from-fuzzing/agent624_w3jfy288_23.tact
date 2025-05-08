message(123456789) Info {
    id: Int;
    description: String;
}

contract OptionalMsgStruct {
    data: Info?;

    init() {
        self.data = null;
    }
}