struct OptionalStruct {
    text: String?;
    number: Int?;
    addr: Address?;
}

contract OptStructStorage {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            text: null,
            number: 999,
            addr: null
        };
    }
}
