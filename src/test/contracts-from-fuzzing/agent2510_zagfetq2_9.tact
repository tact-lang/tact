struct OptionalStruct {
    foo: Int;
    bar: String;
}

contract OptionalStructHolder {
    data: OptionalStruct?;
    init() {
        self.data = null;
    }
}