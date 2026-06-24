struct InnerStruct {
    a: Int;
    b: String;
}

contract BigOptional {
    optInner: InnerStruct?;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.optInner = null;
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
    }
}
