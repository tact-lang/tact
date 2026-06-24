struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Int?;
}

contract TestContract {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            a: 1,
            b: null,
            c: null,
        };
    }
}