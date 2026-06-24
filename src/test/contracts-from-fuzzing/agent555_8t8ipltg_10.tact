struct ParamStruct {
    foo: Int;
    bar: Bool;
}

contract MultiStructFields {
    data1: ParamStruct;
    data2: ParamStruct;
    data3: ParamStruct;

    init() {
        self.data1 = ParamStruct{ foo: 1, bar: true };
        self.data2 = ParamStruct{ foo: 2, bar: false };
        self.data3 = ParamStruct{ foo: 3, bar: true };
    }
}