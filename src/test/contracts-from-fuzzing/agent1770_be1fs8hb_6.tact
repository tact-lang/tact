struct OptionalStruct {
    sub: Nested?;
}

struct Nested {
    x: Int;
    y: Bool;
}

contract OptionStructField {
    store: OptionalStruct;

    init() {
        self.store = OptionalStruct{
            sub: null,
        };
    }
}