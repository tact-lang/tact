struct WrappedString {
    s: String;
}

contract StringInStruct {
    field: WrappedString;

    init() {
        self.field = WrappedString{s:"hello"};
    }
}