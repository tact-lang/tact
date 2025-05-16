struct OptionalStr {
    str: String?;
}

contract ComplexOptStr {
    field: OptionalStr;

    init() {
        self.field = OptionalStr{str: null};
    }
}