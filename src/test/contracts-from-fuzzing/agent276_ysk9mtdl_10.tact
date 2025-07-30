struct ParamStruct {
    a: Int;
    b: Bool;
}

contract ParamsInStruct {
    data: ParamStruct;

    init() {
        self.data = ParamStruct{
            a: 42,
            b: true
        };
    }
}
