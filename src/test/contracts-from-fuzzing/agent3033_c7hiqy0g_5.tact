struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            foo: null,
            bar: true
        };
    }
}
