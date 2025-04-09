struct NoDefaultsStruct {
    val1: Int;
    optVal: Int?;
}

contract ContractWithUninitStruct {
    myData: NoDefaultsStruct;

    init() {
        self.myData = NoDefaultsStruct{
            val1: 5,
            optVal: null
        };
    }
}