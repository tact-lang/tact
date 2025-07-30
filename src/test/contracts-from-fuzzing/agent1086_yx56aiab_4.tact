struct OptionalStruct {
    foo: Int?;
    bar: String?;
    baz: Cell?;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            foo: null,
            bar: null,
            baz: null
        };
    }
}