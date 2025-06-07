struct DeepOptionalInner {
    num: Int?;
    text: String?;
}

contract DeepOptionalStruct {
    optStruct: DeepOptionalInner?;

    init() {
        self.optStruct = null;
    }
}