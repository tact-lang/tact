struct OptionalStringStruct {
    s: String?;
}

contract OptionalStringHolder {
    data: OptionalStringStruct;

    init() {
        self.data = OptionalStringStruct{
            s: null,
        };
    }
}
