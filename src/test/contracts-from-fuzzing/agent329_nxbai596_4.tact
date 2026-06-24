struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: Cell?;
}

contract TestContract {
    optStruct: OptionalStruct;
    init() {
        self.optStruct = OptionalStruct{
            foo: null,
            bar: true,
            baz: emptyCell(),
        };
    }
}