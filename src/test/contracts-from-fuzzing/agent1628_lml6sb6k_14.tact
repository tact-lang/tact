contract OptionalStructOnTop {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}

struct OptionalStruct {
    foo: Int;
    bar: Bool;
    baz: String;
}