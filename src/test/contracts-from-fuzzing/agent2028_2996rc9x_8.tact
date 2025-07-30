struct InnerStruct {
    name: String;
    enabled: Bool;
    comment: String?;
}

contract OptionalInner {
    innerOpt: InnerStruct?;

    init() {
        self.innerOpt = null;
    }
}
