struct OptStruct {
    data: Int?;
    flag: Bool;
}

contract OptionalAssign {
    s: OptStruct;

    init() {
        self.s = OptStruct{
            data: 42,
            flag: true
        };
    }
}