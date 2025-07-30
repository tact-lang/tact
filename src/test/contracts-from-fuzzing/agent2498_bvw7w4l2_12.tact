struct ParamStruct {
    a: Int;
    b: String?;
}

contract TestContract {
    paramField: ParamStruct;

    init() {
        self.paramField = ParamStruct{
            a: 0,
            b: null,
        };
    }
}