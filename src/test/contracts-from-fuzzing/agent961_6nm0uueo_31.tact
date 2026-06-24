struct OptionalStringStruct {
    value: String?;
}

contract OptionalStringStructContract {
    data: OptionalStringStruct;

    init() {
        self.data = OptionalStringStruct { value: null };
    }
}