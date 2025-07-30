struct InnerS {
    text: String;
    flag: Bool;
}

contract OptInnerStruct {
    optInner: InnerS?;

    init() {
        self.optInner = null;
    }
}