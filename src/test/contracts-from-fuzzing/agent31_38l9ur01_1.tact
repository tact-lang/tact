struct OptionalStruct {
    text: String?;
    value: Int?;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            text: null,
            value: null,
        };
    }
}
