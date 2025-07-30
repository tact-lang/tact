struct SimpleS {
    num: Int;
}

contract TopWithOptionalStruct {
    optionalStruct: SimpleS?;

    init() {
        self.optionalStruct = null;
    }
}