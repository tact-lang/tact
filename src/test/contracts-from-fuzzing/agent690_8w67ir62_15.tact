struct WrappedBool {
    b: Bool;
}

contract OptionalInnerStruct {
    s: WrappedBool?;

    init() {
        self.s = null;
    }
}