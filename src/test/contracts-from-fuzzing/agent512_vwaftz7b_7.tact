struct OptionalStruct {
    name: String;
    flag: Bool;
}

contract OptionalStructField {
    data: OptionalStruct?;

    init() {
        self.data = OptionalStruct{
            name: "hello",
            flag: true,
        };
    }

    receive() {}
}