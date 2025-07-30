struct OptionalWrappedString {
    s: String?;
}

contract OptionalWrapStringInStruct {
    optWrapped: OptionalWrappedString?;

    init() {
        self.optWrapped = null;
    }
}