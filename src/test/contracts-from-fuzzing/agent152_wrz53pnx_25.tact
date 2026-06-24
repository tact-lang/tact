struct OptionFieldNested {
    inner: Int?;
}

contract AssignNonNullToOptionalNested {
    data: OptionFieldNested;

    init() {
        self.data = OptionFieldNested{ inner: 42 };
    }
}