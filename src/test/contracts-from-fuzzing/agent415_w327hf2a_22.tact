struct DStruct {
    foo: Int = 42;
    bar: Bool = true;
}

contract OptionalDefaults {
    s: DStruct?;

    init() {
        self.s = null;
    }
}