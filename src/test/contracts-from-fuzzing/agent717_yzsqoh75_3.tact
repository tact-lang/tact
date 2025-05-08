struct OptionalStruct {
    foo: Int?;
    bar: String?;
}

contract TestContract {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{
            foo: null,
            bar: "test"
        };
    }
}