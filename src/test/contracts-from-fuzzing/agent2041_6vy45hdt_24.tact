struct OptionalStruct {
    foo: Int;
    bar: String?;
}

contract OptStructHold {
    data: OptionalStruct?;
    init() {
        self.data = OptionalStruct{
            foo: 10,
            bar: null,
        };
    }
}