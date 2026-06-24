struct InnerStruct {
    one: Int;
    two: Bool;
}

contract OptionalInnerStruct {
    innerOpt: InnerStruct?;
    init() {
        self.innerOpt = null;
    }
}