struct InnerData {
    foo: Int;
}

message(0xABCDEF01) SampleMsg {
    bar: Int;
}

contract OptCompositeFields {
    optStruct: InnerData? = null;
    optMsg: SampleMsg? = null;
    optStr: String? = null;

    init() {
        self.optStruct = null;
        self.optMsg = null;
        self.optStr = "hi";
    }
}
