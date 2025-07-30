struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalStructHolder {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}