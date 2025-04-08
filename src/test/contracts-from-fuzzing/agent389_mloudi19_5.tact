struct ComplexOptional {
    inner: Int?;
    flag: Bool;
}

contract OptStruct {
    str: ComplexOptional;

    init() {
        self.str = ComplexOptional{
            inner: null,
            flag: false
        };
    }
}
