struct OptionalStruct {
    a: Int;
    b: Bool?;
    c: Slice?;
}

contract TestContract {
    state: OptionalStruct;
    init() {
        self.state = OptionalStruct{
            a: 1,
            b: null,
            c: null
        };
    }
}