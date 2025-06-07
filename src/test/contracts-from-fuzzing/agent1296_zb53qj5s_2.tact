struct NestedOptional {
    maybeInt: Int?;
    maybeString: String?;
}

struct ComplexStruct {
    number: Int;
    flag: Bool;
    inner: NestedOptional;
}

contract Example {
    state: ComplexStruct;
    init() {
        self.state = ComplexStruct{
            number: 1,
            flag: true,
            inner: NestedOptional{
                maybeInt: null,
                maybeString: null
            }
        };
    }
}