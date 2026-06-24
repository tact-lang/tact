struct OptStruct {
    x: Int;
    y: String;
}

contract OptionalField {
    data: OptStruct?;

    init() {
        self.data = OptStruct{
            x: 10,
            y: "hi",
        };
    }
}
