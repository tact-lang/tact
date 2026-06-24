struct OptionalStruct {
    name: String;
    value: Int?;
}

contract TestContract {
    optStruct: OptionalStruct;

    init() {
        self.optStruct = OptionalStruct{
            name: "foo",
            value: null
        };
    }
}