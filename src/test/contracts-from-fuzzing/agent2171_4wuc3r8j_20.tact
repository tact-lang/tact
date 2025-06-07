struct NestedOptional {
    inner: Int?;
}

contract OptionalOfStruct {
    data: NestedOptional?;

    init() {
        self.data = NestedOptional{
            inner: 5
        };
    }
}