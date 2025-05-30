struct NestedOptionalContent {
    value: Int?;
    info: String?;
}

contract OptionalFieldWithOptionals {
    myData: NestedOptionalContent?;

    init() {
        self.myData = NestedOptionalContent{
            value: 42,
            info: null,
        };
    }
}
