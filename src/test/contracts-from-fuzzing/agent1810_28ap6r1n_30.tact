struct OptionalStruct {
    a: Int;
}
contract OptNestedStructInOpt {
    s: OptionalStruct?;
    init() {
        self.s = OptionalStruct{a:10};
    }
}