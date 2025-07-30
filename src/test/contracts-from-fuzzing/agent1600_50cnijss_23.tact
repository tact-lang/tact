struct StringStruct {
    label: String;
    value: Int;
}

contract TestContract {
    data: StringStruct;

    init() {
        self.data = StringStruct{
            label: "testing",
            value: 123
        };
    }
}