struct OptionalStr {
    a: Int?;
}

contract AssignNullOptionalStructField {
    v: OptionalStr;

    init() {
        self.v = OptionalStr{ a: null };
    }
}