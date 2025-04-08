struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract OptionalInOptionalStruct {
    data: InnerOpt?;

    init() {
        self.data = null;
    }
}