struct OptionalInStruct {
    s: String?;
    number: Int;
}

contract TestContract {
    data: OptionalInStruct;

    init() {
        self.data = OptionalInStruct{
            s: null,
            number: 99
        };
    }
}