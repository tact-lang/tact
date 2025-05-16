struct OptionalStruct {
    a: Int;
}

contract OptionalStructHolder {
    s: OptionalStruct?;

    init() {
        self.s = OptionalStruct{
            a: 11
        };
    }
}