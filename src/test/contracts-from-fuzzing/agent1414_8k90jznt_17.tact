struct ComplexOpt {
    a: Int;
    b: Int?;
    c: Bool?;
}

contract OptionalWholeStruct {
    content: ComplexOpt?;

    init() {
        self.content = null;
    }
}