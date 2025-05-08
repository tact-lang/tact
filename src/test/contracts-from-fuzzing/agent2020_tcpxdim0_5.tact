struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalInStorage {
    opt: OptionalStruct?;

    init() {
        self.opt = OptionalStruct{
            foo: 7,
            bar: false,
        };
    }
}
