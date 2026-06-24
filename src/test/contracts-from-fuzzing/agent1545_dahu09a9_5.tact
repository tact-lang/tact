struct OptionalStruct {
    val: Int?;
    text: String?;
    sender: Address?;
}

contract OptionalFields {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{ val: null, text: null, sender: null };
    }
}
