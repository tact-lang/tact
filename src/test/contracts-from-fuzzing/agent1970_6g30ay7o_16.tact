struct OptStruct {
    a: Int;
    b: Bool?;
    c: Slice?;
}

contract ManyOpts {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            a: 12,
            b: null,
            c: emptyCell().asSlice(),
        };
    }
}