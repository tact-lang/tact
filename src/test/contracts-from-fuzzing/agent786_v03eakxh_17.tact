struct WrappedString {
    s: String;
}

contract WrapStringInStruct {
    wrapped: WrappedString;

    init() {
        self.wrapped = WrappedString{ s: "abc" };
    }
}