struct DefaultStruct {
    hasDefault: Int? = null;
    noDefault: Int?;
}

contract DefaultOptVals {
    val: DefaultStruct;

    init() {
        self.val = DefaultStruct{
            hasDefault: null,
            noDefault: 456
        };
    }
}