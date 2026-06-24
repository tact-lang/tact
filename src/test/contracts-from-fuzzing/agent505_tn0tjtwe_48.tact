struct ComplexOptional {
    a: Int = 42;
    b: Int?;
    c: Bool?;
    d: String = "hello";
}

contract OptWrapStruct {
    comp: ComplexOptional?;

    init() {
        self.comp = null;
    }
}
