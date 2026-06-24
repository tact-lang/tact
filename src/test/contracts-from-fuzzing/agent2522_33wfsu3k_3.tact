struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            foo: null,
            bar: true
        };
    }
}